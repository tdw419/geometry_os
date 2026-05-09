; DESCRIPTION: Renders a red disk with center (273, 85) and radius 56.
; PLAN: r0=273(x), r1=85(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 85
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
