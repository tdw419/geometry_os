; DESCRIPTION: Renders a black disk with center (212, 133) and radius 36.
; PLAN: r0=212(x), r1=133(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 133
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
