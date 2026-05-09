; DESCRIPTION: Renders a magenta disk with center (216, 152) and radius 60.
; PLAN: r0=216(x), r1=152(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 152
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
