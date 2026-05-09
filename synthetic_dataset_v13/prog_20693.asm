; DESCRIPTION: Renders a magenta disk with center (102, 160) and radius 15.
; PLAN: r0=102(x), r1=160(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 160
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
