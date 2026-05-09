; DESCRIPTION: Renders a magenta disk with center (317, 38) and radius 30.
; PLAN: r0=317(x), r1=38(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 38
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
