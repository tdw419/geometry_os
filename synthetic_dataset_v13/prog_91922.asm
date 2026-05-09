; DESCRIPTION: Places a orange circle of radius 29 at center (193, 65).
; PLAN: r0=193(x), r1=65(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 65
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
