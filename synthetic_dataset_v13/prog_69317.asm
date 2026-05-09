; DESCRIPTION: Places a orange circle of radius 59 at center (303, 138).
; PLAN: r0=303(x), r1=138(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 138
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
