; DESCRIPTION: Places a cyan circle of radius 64 at center (219, 85).
; PLAN: r0=219(x), r1=85(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 85
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
