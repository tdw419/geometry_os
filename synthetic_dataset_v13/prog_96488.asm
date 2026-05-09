; DESCRIPTION: Renders a magenta disk with center (222, 125) and radius 55.
; PLAN: r0=222(x), r1=125(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 125
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
