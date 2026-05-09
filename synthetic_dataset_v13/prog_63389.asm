; DESCRIPTION: Renders a red disk with center (132, 172) and radius 31.
; PLAN: r0=132(x), r1=172(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 172
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
