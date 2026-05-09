; DESCRIPTION: Renders a orange disk with center (221, 145) and radius 68.
; PLAN: r0=221(x), r1=145(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 145
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
