; DESCRIPTION: Places a orange circle of radius 33 at center (45, 50).
; PLAN: r0=45(x), r1=50(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 50
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
