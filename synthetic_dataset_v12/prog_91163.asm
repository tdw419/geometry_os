; DESCRIPTION: Places a orange circle of radius 36 at center (86, 178).
; PLAN: r0=86(x), r1=178(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 178
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
