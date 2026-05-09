; DESCRIPTION: Renders a orange disk with center (198, 99) and radius 55.
; PLAN: r0=198(x), r1=99(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 99
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
