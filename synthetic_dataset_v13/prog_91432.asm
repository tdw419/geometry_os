; DESCRIPTION: Places a cyan circle of radius 24 at center (134, 26).
; PLAN: r0=134(x), r1=26(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 26
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
