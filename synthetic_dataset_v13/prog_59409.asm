; DESCRIPTION: Composite: Places a orange dot at position (153, 227) then Draws a purple line from (216, 235) to (34, 172) then Renders a orange disk with center (162, 139) and radius 68.
; PLAN: r0=153(x), r1=227(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=216(x1), r6=235(y1), r7=34(x2), r8=172(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=162(x), r11=139(y), r12=68(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 227
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 216
LDI r6, 235
LDI r7, 34
LDI r8, 172
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 139
LDI r12, 68
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
