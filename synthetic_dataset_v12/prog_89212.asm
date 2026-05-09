; DESCRIPTION: Renders a orange disk with center (278, 161) and radius 58.
; PLAN: r0=278(x), r1=161(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 161
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
