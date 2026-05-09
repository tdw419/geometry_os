; DESCRIPTION: Places a cyan circle of radius 33 at center (129, 115).
; PLAN: r0=129(x), r1=115(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 115
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
