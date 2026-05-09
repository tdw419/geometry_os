; DESCRIPTION: Places a orange circle of radius 63 at center (92, 181).
; PLAN: r0=92(x), r1=181(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 181
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
