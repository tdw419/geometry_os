; DESCRIPTION: Places a orange circle of radius 65 at center (186, 149).
; PLAN: r0=186(x), r1=149(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 149
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
