; DESCRIPTION: Renders a red disk with center (323, 120) and radius 64.
; PLAN: r0=323(x), r1=120(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 120
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
