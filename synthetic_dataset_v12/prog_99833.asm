; DESCRIPTION: Composite: Places a orange dot at position (449, 226) then Renders a blue line between points (194, 69) and (67, 24) then Creates a black circular shape at (81, 157) with radius 41.
; PLAN: r0=449(x), r1=226(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=194(x1), r6=69(y1), r7=67(x2), r8=24(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=157(y), r12=41(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 449
LDI r1, 226
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 194
LDI r6, 69
LDI r7, 67
LDI r8, 24
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 157
LDI r12, 41
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
