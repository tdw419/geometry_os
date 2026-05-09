; DESCRIPTION: Places a orange circle of radius 78 at center (217, 175).
; PLAN: r0=217(x), r1=175(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 175
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
