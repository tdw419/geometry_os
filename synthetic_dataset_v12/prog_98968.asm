; DESCRIPTION: Places a orange circle of radius 72 at center (124, 180).
; PLAN: r0=124(x), r1=180(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 180
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
