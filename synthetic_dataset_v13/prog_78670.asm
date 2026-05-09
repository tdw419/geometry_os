; DESCRIPTION: Places a orange circle of radius 63 at center (63, 94).
; PLAN: r0=63(x), r1=94(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 94
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
