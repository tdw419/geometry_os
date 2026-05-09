; DESCRIPTION: Composite: Places a green line segment connecting (151, 245) to (472, 0) then Places a orange circle of radius 52 at center (459, 191).
; PLAN: r0=151(x1), r1=245(y1), r2=472(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=191(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 151
LDI r1, 245
LDI r2, 472
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 191
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
