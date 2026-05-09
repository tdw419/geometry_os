; DESCRIPTION: Composite: Renders a black disk with center (249, 172) and radius 80 then Places a red dot at position (485, 254).
; PLAN: r0=249(x), r1=172(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=485(x), r6=254(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 172
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 485
LDI r6, 254
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
