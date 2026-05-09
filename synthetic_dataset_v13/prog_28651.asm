; DESCRIPTION: Places a cyan circle of radius 28 at center (285, 110).
; PLAN: r0=285(x), r1=110(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 110
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
