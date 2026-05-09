; DESCRIPTION: Creates a orange circular shape at (337, 170) with radius 80.
; PLAN: r0=337(x), r1=170(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 170
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
