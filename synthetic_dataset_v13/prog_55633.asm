; DESCRIPTION: Places a orange circle of radius 54 at center (392, 77).
; PLAN: r0=392(x), r1=77(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 77
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
