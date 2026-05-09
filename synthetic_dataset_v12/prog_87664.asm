; DESCRIPTION: Places a cyan circle of radius 72 at center (366, 78).
; PLAN: r0=366(x), r1=78(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 78
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
