; DESCRIPTION: Places a cyan circle of radius 33 at center (93, 217).
; PLAN: r0=93(x), r1=217(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 217
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
