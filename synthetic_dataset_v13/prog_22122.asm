; DESCRIPTION: Composite: Renders a cyan box of size 23x86 starting at (243, 79) then Draws a magenta line from (167, 201) to (15, 199) then Draws a orange circle centered at (458, 167) with radius 35.
; PLAN: r0=243(x), r1=79(y), r2=23(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x1), r6=201(y1), r7=15(x2), r8=199(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=167(y), r12=35(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 243
LDI r1, 79
LDI r2, 23
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 201
LDI r7, 15
LDI r8, 199
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 167
LDI r12, 35
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
