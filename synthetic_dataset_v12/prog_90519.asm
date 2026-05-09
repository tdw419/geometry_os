; DESCRIPTION: Places a orange circle of radius 55 at center (86, 173).
; PLAN: r0=86(x), r1=173(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 173
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
