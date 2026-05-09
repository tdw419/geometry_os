; DESCRIPTION: Places a blue circle of radius 68 at center (338, 83).
; PLAN: r0=338(x), r1=83(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 83
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
