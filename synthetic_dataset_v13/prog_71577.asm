; DESCRIPTION: Places a orange circle of radius 36 at center (353, 44).
; PLAN: r0=353(x), r1=44(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 44
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
