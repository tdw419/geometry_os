; DESCRIPTION: Places a cyan circle of radius 76 at center (226, 110).
; PLAN: r0=226(x), r1=110(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 110
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
