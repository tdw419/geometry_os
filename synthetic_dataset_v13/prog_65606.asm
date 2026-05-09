; DESCRIPTION: Places a orange circle of radius 38 at center (286, 118).
; PLAN: r0=286(x), r1=118(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 118
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
