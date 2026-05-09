; DESCRIPTION: Places a orange circle of radius 44 at center (171, 126).
; PLAN: r0=171(x), r1=126(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 126
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
