; DESCRIPTION: Composite: Places a yellow line segment connecting (348, 150) to (379, 108) then Places a orange circle of radius 17 at center (112, 122).
; PLAN: r0=348(x1), r1=150(y1), r2=379(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=122(y), r7=17(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 348
LDI r1, 150
LDI r2, 379
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 122
LDI r7, 17
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
