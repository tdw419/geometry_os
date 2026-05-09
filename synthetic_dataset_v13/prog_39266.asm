; DESCRIPTION: Places a orange circle of radius 47 at center (275, 187).
; PLAN: r0=275(x), r1=187(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 187
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
