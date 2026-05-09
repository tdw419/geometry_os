; DESCRIPTION: Places a cyan circle of radius 18 at center (230, 84).
; PLAN: r0=230(x), r1=84(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 84
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
