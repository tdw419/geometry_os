; DESCRIPTION: Renders a orange disk with center (416, 94) and radius 63.
; PLAN: r0=416(x), r1=94(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 94
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
