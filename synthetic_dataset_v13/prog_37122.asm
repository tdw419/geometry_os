; DESCRIPTION: Places a orange circle of radius 33 at center (36, 108).
; PLAN: r0=36(x), r1=108(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 108
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
