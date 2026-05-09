; DESCRIPTION: Renders a magenta disk with center (237, 161) and radius 22.
; PLAN: r0=237(x), r1=161(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 161
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
