; DESCRIPTION: Composite: Renders a cyan disk with center (91, 159) and radius 19 then Places a blue dot at position (348, 70).
; PLAN: r0=91(x), r1=159(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=70(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 159
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 70
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
