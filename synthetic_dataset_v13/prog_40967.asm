; DESCRIPTION: Renders a yellow disk with center (198, 157) and radius 77.
; PLAN: r0=198(x), r1=157(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 157
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
