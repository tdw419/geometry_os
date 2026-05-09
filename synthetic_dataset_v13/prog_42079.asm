; DESCRIPTION: Places a orange circle of radius 32 at center (55, 107).
; PLAN: r0=55(x), r1=107(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 107
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
