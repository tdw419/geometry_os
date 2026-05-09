; DESCRIPTION: Places a orange circle of radius 24 at center (368, 223).
; PLAN: r0=368(x), r1=223(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 223
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
