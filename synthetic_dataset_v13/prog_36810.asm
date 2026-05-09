; DESCRIPTION: Composite: Places a cyan line segment connecting (326, 17) to (375, 219) then Places a orange circle of radius 30 at center (109, 128).
; PLAN: r0=326(x1), r1=17(y1), r2=375(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=128(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 326
LDI r1, 17
LDI r2, 375
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 128
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
