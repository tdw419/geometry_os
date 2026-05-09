; DESCRIPTION: Places a cyan circle of radius 10 at center (62, 211).
; PLAN: r0=62(x), r1=211(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 211
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
