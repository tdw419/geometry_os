; DESCRIPTION: Renders a orange disk with center (395, 122) and radius 79.
; PLAN: r0=395(x), r1=122(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 122
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
