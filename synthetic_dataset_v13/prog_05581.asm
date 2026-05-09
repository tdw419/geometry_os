; DESCRIPTION: Composite: Renders a orange disk with center (289, 178) and radius 27 then Draws a green line from (507, 119) to (332, 122).
; PLAN: r0=289(x), r1=178(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x1), r6=119(y1), r7=332(x2), r8=122(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 178
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 119
LDI r7, 332
LDI r8, 122
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
