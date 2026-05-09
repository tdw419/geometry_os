; DESCRIPTION: Places a cyan circle of radius 56 at center (402, 149).
; PLAN: r0=402(x), r1=149(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 149
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
