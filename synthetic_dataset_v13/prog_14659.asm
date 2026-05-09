; DESCRIPTION: Renders a red disk with center (81, 171) and radius 52.
; PLAN: r0=81(x), r1=171(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 171
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
