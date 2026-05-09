; DESCRIPTION: Renders a orange disk with center (412, 33) and radius 23.
; PLAN: r0=412(x), r1=33(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 33
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
