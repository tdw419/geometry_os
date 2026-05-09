; DESCRIPTION: Places a orange circle of radius 14 at center (283, 174).
; PLAN: r0=283(x), r1=174(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 174
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
