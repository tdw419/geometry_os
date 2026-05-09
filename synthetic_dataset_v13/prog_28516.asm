; DESCRIPTION: Places a orange circle of radius 65 at center (70, 172).
; PLAN: r0=70(x), r1=172(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 172
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
