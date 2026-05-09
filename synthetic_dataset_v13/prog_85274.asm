; DESCRIPTION: Renders a magenta disk with center (206, 110) and radius 76.
; PLAN: r0=206(x), r1=110(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 110
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
