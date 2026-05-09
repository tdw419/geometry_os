; DESCRIPTION: Composite: Places a yellow dot at position (371, 183) then Renders a orange line between points (388, 69) and (185, 103) then Places a purple circle of radius 50 at center (452, 120).
; PLAN: r0=371(x), r1=183(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=388(x1), r6=69(y1), r7=185(x2), r8=103(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=452(x), r11=120(y), r12=50(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 183
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 388
LDI r6, 69
LDI r7, 185
LDI r8, 103
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 120
LDI r12, 50
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
