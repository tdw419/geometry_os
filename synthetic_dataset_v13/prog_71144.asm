; DESCRIPTION: Renders a magenta disk with center (316, 162) and radius 46.
; PLAN: r0=316(x), r1=162(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 162
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
