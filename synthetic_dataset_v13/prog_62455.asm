; DESCRIPTION: Places a orange circle of radius 52 at center (227, 180).
; PLAN: r0=227(x), r1=180(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 180
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
