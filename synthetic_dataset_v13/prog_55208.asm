; DESCRIPTION: Renders a yellow disk with center (316, 181) and radius 48.
; PLAN: r0=316(x), r1=181(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 181
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
