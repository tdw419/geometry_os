; DESCRIPTION: Places a orange circle of radius 30 at center (48, 89).
; PLAN: r0=48(x), r1=89(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 89
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
