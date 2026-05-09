; DESCRIPTION: Places a cyan circle of radius 35 at center (314, 83).
; PLAN: r0=314(x), r1=83(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 83
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
