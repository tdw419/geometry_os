; DESCRIPTION: Places a orange circle of radius 54 at center (112, 171).
; PLAN: r0=112(x), r1=171(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 171
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
