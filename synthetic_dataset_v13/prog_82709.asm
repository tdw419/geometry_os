; DESCRIPTION: Places a orange circle of radius 54 at center (355, 65).
; PLAN: r0=355(x), r1=65(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 65
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
