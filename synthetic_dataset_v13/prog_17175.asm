; DESCRIPTION: Renders a magenta disk with center (68, 68) and radius 59.
; PLAN: r0=68(x), r1=68(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 68
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
