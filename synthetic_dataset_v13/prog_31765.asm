; DESCRIPTION: Composite: Draws a magenta line from (87, 177) to (212, 96) then Places a orange circle of radius 41 at center (412, 69) then Places a blue dot at position (271, 140).
; PLAN: r0=87(x1), r1=177(y1), r2=212(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=69(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x), r11=140(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 177
LDI r2, 212
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 69
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 140
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
