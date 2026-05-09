; DESCRIPTION: Places a black circle of radius 70 at center (153, 152).
; PLAN: r0=153(x), r1=152(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 152
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
