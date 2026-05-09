; DESCRIPTION: Places a orange circle of radius 66 at center (228, 110).
; PLAN: r0=228(x), r1=110(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 110
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
