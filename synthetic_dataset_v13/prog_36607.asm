; DESCRIPTION: Renders a red disk with center (106, 120) and radius 63.
; PLAN: r0=106(x), r1=120(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 120
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
