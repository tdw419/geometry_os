; DESCRIPTION: Places a orange circle of radius 74 at center (264, 162).
; PLAN: r0=264(x), r1=162(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 162
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
