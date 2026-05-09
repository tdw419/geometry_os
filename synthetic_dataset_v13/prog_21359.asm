; DESCRIPTION: Composite: Sets a single red pixel at (491, 160) then Renders a blue disk with center (456, 70) and radius 51.
; PLAN: r0=491(x), r1=160(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=456(x), r6=70(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 491
LDI r1, 160
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 456
LDI r6, 70
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
