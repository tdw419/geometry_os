; DESCRIPTION: Places a cyan circle of radius 34 at center (230, 110).
; PLAN: r0=230(x), r1=110(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 110
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
