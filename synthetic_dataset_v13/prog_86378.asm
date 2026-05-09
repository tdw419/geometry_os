; DESCRIPTION: Renders a yellow disk with center (174, 66) and radius 40.
; PLAN: r0=174(x), r1=66(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 66
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
