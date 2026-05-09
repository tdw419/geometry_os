; DESCRIPTION: Renders a red disk with center (83, 120) and radius 11.
; PLAN: r0=83(x), r1=120(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 120
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
