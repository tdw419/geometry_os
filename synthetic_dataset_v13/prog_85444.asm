; DESCRIPTION: Renders a red disk with center (82, 88) and radius 36.
; PLAN: r0=82(x), r1=88(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 88
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
