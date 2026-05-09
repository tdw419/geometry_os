; DESCRIPTION: Places a orange circle of radius 64 at center (118, 162).
; PLAN: r0=118(x), r1=162(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 162
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
