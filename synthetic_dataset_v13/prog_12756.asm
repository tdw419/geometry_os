; DESCRIPTION: Composite: Sets a single green pixel at (507, 147) then Draws a blue line from (109, 83) to (340, 36) then Draws a blue circle centered at (78, 148) with radius 74.
; PLAN: r0=507(x), r1=147(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=83(y1), r7=340(x2), r8=36(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=78(x), r11=148(y), r12=74(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 507
LDI r1, 147
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 109
LDI r6, 83
LDI r7, 340
LDI r8, 36
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 148
LDI r12, 74
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
