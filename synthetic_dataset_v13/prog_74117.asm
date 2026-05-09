; DESCRIPTION: Renders a magenta disk with center (152, 68) and radius 66.
; PLAN: r0=152(x), r1=68(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 68
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
