; DESCRIPTION: Composite: Draws a blue line from (6, 138) to (12, 97) then Places a purple dot at position (506, 127) then Places a red circle of radius 24 at center (149, 32).
; PLAN: r0=6(x1), r1=138(y1), r2=12(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=506(x), r6=127(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=149(x), r11=32(y), r12=24(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 6
LDI r1, 138
LDI r2, 12
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 127
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 149
LDI r11, 32
LDI r12, 24
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
