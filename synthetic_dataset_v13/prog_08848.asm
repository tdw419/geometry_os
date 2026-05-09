; DESCRIPTION: Places a white circle of radius 55 at center (371, 158).
; PLAN: r0=371(x), r1=158(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 158
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
