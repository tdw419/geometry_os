; DESCRIPTION: Composite: Draws a magenta line from (146, 71) to (45, 222) then Renders a orange box of size 102x41 starting at (43, 162) then Places a cyan dot at position (419, 222).
; PLAN: r0=146(x1), r1=71(y1), r2=45(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=162(y), r7=102(width), r8=41(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=419(x), r11=222(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 71
LDI r2, 45
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 162
LDI r7, 102
LDI r8, 41
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 222
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
