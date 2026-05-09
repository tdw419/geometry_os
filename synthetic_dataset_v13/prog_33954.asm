; DESCRIPTION: Places a orange circle of radius 35 at center (344, 205).
; PLAN: r0=344(x), r1=205(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 205
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
