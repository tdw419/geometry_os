; DESCRIPTION: Places a orange circle of radius 72 at center (427, 135).
; PLAN: r0=427(x), r1=135(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 135
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
