; DESCRIPTION: Places a orange circle of radius 33 at center (209, 188).
; PLAN: r0=209(x), r1=188(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 188
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
