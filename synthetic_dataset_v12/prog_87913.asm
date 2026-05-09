; DESCRIPTION: Renders a red disk with center (144, 116) and radius 33.
; PLAN: r0=144(x), r1=116(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 116
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
