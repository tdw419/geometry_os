; DESCRIPTION: Places a orange circle of radius 36 at center (408, 137).
; PLAN: r0=408(x), r1=137(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 137
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
