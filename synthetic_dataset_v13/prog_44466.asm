; DESCRIPTION: Places a orange circle of radius 16 at center (339, 176).
; PLAN: r0=339(x), r1=176(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 176
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
