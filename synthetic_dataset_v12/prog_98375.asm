; DESCRIPTION: Places a cyan circle of radius 57 at center (141, 58).
; PLAN: r0=141(x), r1=58(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 58
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
