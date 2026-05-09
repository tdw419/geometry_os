; DESCRIPTION: Places a green circle of radius 52 at center (97, 73).
; PLAN: r0=97(x), r1=73(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 73
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
