; DESCRIPTION: Renders a magenta disk with center (432, 122) and radius 56.
; PLAN: r0=432(x), r1=122(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 122
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
