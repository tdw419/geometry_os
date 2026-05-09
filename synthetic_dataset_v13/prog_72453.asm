; DESCRIPTION: Renders a red disk with center (317, 155) and radius 51.
; PLAN: r0=317(x), r1=155(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 155
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
