; DESCRIPTION: Places a orange circle of radius 80 at center (178, 83).
; PLAN: r0=178(x), r1=83(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 83
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
