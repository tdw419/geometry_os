; DESCRIPTION: Places a black circle of radius 73 at center (191, 152).
; PLAN: r0=191(x), r1=152(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 152
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
