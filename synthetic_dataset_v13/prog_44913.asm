; DESCRIPTION: Creates a orange circular shape at (388, 133) with radius 79.
; PLAN: r0=388(x), r1=133(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 133
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
