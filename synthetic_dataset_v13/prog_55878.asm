; DESCRIPTION: Places a orange circle of radius 44 at center (214, 96).
; PLAN: r0=214(x), r1=96(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 96
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
