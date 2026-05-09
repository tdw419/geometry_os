; DESCRIPTION: Places a red circle of radius 11 at center (172, 79).
; PLAN: r0=172(x), r1=79(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 79
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
