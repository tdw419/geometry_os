; DESCRIPTION: Places a blue circle of radius 39 at center (439, 52).
; PLAN: r0=439(x), r1=52(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 52
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
