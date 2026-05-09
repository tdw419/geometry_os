; DESCRIPTION: Places a white circle of radius 32 at center (315, 219).
; PLAN: r0=315(x), r1=219(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 219
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
