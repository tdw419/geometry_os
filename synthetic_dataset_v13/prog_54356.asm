; DESCRIPTION: Renders a red disk with center (77, 179) and radius 60.
; PLAN: r0=77(x), r1=179(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 179
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
