; DESCRIPTION: Places a orange circle of radius 52 at center (73, 83).
; PLAN: r0=73(x), r1=83(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 83
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
