; DESCRIPTION: Places a orange circle of radius 21 at center (264, 29).
; PLAN: r0=264(x), r1=29(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 29
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
