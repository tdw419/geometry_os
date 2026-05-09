; DESCRIPTION: Renders a black disk with center (433, 181) and radius 46.
; PLAN: r0=433(x), r1=181(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 181
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
