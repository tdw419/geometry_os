; DESCRIPTION: Places a orange circle of radius 65 at center (323, 158).
; PLAN: r0=323(x), r1=158(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 158
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
