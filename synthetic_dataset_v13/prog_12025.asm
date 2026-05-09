; DESCRIPTION: Renders a orange disk with center (127, 91) and radius 73.
; PLAN: r0=127(x), r1=91(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 91
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
