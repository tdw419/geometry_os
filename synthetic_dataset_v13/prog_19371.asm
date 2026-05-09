; DESCRIPTION: Composite: Draws a purple line from (444, 214) to (193, 190) then Places a red dot at position (24, 122) then Renders a blue disk with center (110, 51) and radius 36.
; PLAN: r0=444(x1), r1=214(y1), r2=193(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=122(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=110(x), r11=51(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 444
LDI r1, 214
LDI r2, 193
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 122
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 110
LDI r11, 51
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
