; DESCRIPTION: Composite: Renders a red disk with center (423, 180) and radius 74 then Places a orange dot at position (49, 184).
; PLAN: r0=423(x), r1=180(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=184(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 180
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 184
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
