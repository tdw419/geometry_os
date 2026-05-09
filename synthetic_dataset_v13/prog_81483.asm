; DESCRIPTION: Renders a red disk with center (225, 157) and radius 77.
; PLAN: r0=225(x), r1=157(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 157
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
