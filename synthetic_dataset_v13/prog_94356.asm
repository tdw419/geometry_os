; DESCRIPTION: Places a white circle of radius 20 at center (366, 128).
; PLAN: r0=366(x), r1=128(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 128
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
