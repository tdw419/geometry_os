; DESCRIPTION: Places a cyan circle of radius 10 at center (155, 137).
; PLAN: r0=155(x), r1=137(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 137
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
