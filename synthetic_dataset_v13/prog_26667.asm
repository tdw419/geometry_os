; DESCRIPTION: Places a orange circle of radius 74 at center (273, 77).
; PLAN: r0=273(x), r1=77(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 77
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
