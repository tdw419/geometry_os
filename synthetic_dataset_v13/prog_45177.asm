; DESCRIPTION: Places a green circle of radius 30 at center (52, 218).
; PLAN: r0=52(x), r1=218(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 218
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
