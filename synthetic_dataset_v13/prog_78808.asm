; DESCRIPTION: Renders a magenta disk with center (485, 114) and radius 16.
; PLAN: r0=485(x), r1=114(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 485
LDI r1, 114
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
