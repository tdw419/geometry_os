; DESCRIPTION: Composite: Renders a black disk with center (394, 30) and radius 12 then Renders a blue line between points (497, 3) and (499, 10).
; PLAN: r0=394(x), r1=30(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x1), r6=3(y1), r7=499(x2), r8=10(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 30
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 3
LDI r7, 499
LDI r8, 10
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
