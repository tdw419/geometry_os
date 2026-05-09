; DESCRIPTION: Renders a black disk with center (135, 206) and radius 45.
; PLAN: r0=135(x), r1=206(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 206
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
