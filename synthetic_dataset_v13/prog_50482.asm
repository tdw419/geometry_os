; DESCRIPTION: Places a orange circle of radius 76 at center (208, 152).
; PLAN: r0=208(x), r1=152(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 152
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
