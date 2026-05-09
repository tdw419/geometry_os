; DESCRIPTION: Places a orange circle of radius 34 at center (65, 221).
; PLAN: r0=65(x), r1=221(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 221
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
