; DESCRIPTION: Places a cyan circle of radius 35 at center (141, 72).
; PLAN: r0=141(x), r1=72(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 72
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
