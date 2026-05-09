; DESCRIPTION: Renders a black disk with center (288, 188) and radius 16.
; PLAN: r0=288(x), r1=188(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 188
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
