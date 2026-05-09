; DESCRIPTION: Places a orange circle of radius 80 at center (425, 89).
; PLAN: r0=425(x), r1=89(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 89
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
