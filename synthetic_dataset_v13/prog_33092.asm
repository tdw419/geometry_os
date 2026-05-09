; DESCRIPTION: Places a cyan circle of radius 60 at center (436, 62).
; PLAN: r0=436(x), r1=62(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 62
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
