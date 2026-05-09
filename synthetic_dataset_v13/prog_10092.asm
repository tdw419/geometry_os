; DESCRIPTION: Places a orange circle of radius 22 at center (211, 120).
; PLAN: r0=211(x), r1=120(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 120
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
