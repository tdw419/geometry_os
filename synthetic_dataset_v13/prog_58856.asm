; DESCRIPTION: Renders a black disk with center (360, 162) and radius 38.
; PLAN: r0=360(x), r1=162(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 162
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
