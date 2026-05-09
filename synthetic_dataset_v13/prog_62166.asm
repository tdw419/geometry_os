; DESCRIPTION: Places a orange circle of radius 80 at center (124, 175).
; PLAN: r0=124(x), r1=175(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 175
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
