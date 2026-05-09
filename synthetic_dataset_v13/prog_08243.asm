; DESCRIPTION: Composite: Renders a purple disk with center (285, 85) and radius 75 then Places a red dot at position (192, 107).
; PLAN: r0=285(x), r1=85(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=107(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 285
LDI r1, 85
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 107
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
