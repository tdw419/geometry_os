; DESCRIPTION: Places a orange circle of radius 35 at center (305, 43).
; PLAN: r0=305(x), r1=43(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 43
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
