; DESCRIPTION: Composite: Renders a green disk with center (34, 35) and radius 13 then Places a green line segment connecting (422, 62) to (394, 191) then Sets a single black pixel at (348, 196).
; PLAN: r0=34(x), r1=35(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x1), r6=62(y1), r7=394(x2), r8=191(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=348(x), r11=196(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 34
LDI r1, 35
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 62
LDI r7, 394
LDI r8, 191
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 196
LDI r12, 0x000000
PSET r10, r11, r12
HALT
