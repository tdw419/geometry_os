; DESCRIPTION: Composite: Renders a cyan line between points (348, 1) and (491, 43) then Places a purple dot at position (326, 12) then Renders a white disk with center (199, 191) and radius 51.
; PLAN: r0=348(x1), r1=1(y1), r2=491(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=12(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=199(x), r11=191(y), r12=51(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 348
LDI r1, 1
LDI r2, 491
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 12
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 199
LDI r11, 191
LDI r12, 51
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
