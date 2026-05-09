; DESCRIPTION: Renders a magenta disk with center (440, 212) and radius 30.
; PLAN: r0=440(x), r1=212(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 212
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
