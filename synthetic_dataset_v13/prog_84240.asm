; DESCRIPTION: Places a cyan circle of radius 33 at center (417, 137).
; PLAN: r0=417(x), r1=137(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 137
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
