; DESCRIPTION: Places a orange circle of radius 61 at center (446, 136).
; PLAN: r0=446(x), r1=136(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 136
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
