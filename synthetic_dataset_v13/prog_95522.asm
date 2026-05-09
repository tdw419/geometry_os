; DESCRIPTION: Composite: Renders a orange disk with center (285, 70) and radius 68 then Renders a purple line between points (240, 24) and (203, 245).
; PLAN: r0=285(x), r1=70(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x1), r6=24(y1), r7=203(x2), r8=245(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 70
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 24
LDI r7, 203
LDI r8, 245
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
