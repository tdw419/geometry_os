; DESCRIPTION: Renders a red disk with center (131, 45) and radius 25.
; PLAN: r0=131(x), r1=45(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 45
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
