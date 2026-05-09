; DESCRIPTION: Places a orange circle of radius 56 at center (116, 162).
; PLAN: r0=116(x), r1=162(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 162
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
