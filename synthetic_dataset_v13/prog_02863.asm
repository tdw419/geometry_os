; DESCRIPTION: Places a cyan circle of radius 63 at center (115, 104).
; PLAN: r0=115(x), r1=104(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 104
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
