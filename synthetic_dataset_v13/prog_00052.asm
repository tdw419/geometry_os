; DESCRIPTION: Composite: Renders a cyan box of size 11x56 starting at (36, 44) then Draws a magenta line from (222, 202) to (246, 76) then Places a magenta circle of radius 79 at center (158, 165).
; PLAN: r0=36(x), r1=44(y), r2=11(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x1), r6=202(y1), r7=246(x2), r8=76(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=158(x), r11=165(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 36
LDI r1, 44
LDI r2, 11
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 202
LDI r7, 246
LDI r8, 76
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 165
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
