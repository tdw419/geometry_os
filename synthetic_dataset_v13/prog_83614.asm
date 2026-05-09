; DESCRIPTION: Renders a red disk with center (105, 171) and radius 30.
; PLAN: r0=105(x), r1=171(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 171
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
