; DESCRIPTION: Places a black circle of radius 48 at center (383, 152).
; PLAN: r0=383(x), r1=152(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 152
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
