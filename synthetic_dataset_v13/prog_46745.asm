; DESCRIPTION: Places a orange circle of radius 44 at center (174, 83).
; PLAN: r0=174(x), r1=83(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 83
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
