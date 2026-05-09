; DESCRIPTION: Places a orange circle of radius 22 at center (176, 24).
; PLAN: r0=176(x), r1=24(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 24
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
