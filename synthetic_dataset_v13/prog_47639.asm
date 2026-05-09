; DESCRIPTION: Places a cyan circle of radius 32 at center (436, 119).
; PLAN: r0=436(x), r1=119(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 119
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
