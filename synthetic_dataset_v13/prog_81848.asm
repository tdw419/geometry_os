; DESCRIPTION: Places a orange circle of radius 29 at center (367, 220).
; PLAN: r0=367(x), r1=220(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 220
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
