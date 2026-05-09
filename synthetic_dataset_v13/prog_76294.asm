; DESCRIPTION: Renders a red disk with center (419, 45) and radius 31.
; PLAN: r0=419(x), r1=45(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 45
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
