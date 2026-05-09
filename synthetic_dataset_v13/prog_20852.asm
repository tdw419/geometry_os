; DESCRIPTION: Renders a magenta disk with center (385, 79) and radius 68.
; PLAN: r0=385(x), r1=79(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 79
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
