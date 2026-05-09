; DESCRIPTION: Renders a red disk with center (25, 199) and radius 22.
; PLAN: r0=25(x), r1=199(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 199
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
