; DESCRIPTION: Places a orange circle of radius 70 at center (154, 145).
; PLAN: r0=154(x), r1=145(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 145
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
