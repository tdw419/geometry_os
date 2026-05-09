; DESCRIPTION: Places a orange circle of radius 20 at center (303, 28).
; PLAN: r0=303(x), r1=28(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 28
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
