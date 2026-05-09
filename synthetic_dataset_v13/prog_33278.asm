; DESCRIPTION: Composite: Places a orange circle of radius 11 at center (109, 230) then Renders a orange line between points (383, 230) and (176, 227).
; PLAN: r0=109(x), r1=230(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x1), r6=230(y1), r7=176(x2), r8=227(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 230
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 230
LDI r7, 176
LDI r8, 227
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
