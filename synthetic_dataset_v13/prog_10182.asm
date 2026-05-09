; DESCRIPTION: Places a cyan circle of radius 21 at center (137, 70).
; PLAN: r0=137(x), r1=70(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 70
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
