; DESCRIPTION: Renders a black disk with center (110, 95) and radius 59.
; PLAN: r0=110(x), r1=95(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 95
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
