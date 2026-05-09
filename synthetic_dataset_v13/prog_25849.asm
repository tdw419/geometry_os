; DESCRIPTION: Places a orange circle of radius 77 at center (237, 152).
; PLAN: r0=237(x), r1=152(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 152
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
