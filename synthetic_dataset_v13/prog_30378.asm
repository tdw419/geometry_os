; DESCRIPTION: Renders a magenta disk with center (38, 150) and radius 28.
; PLAN: r0=38(x), r1=150(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 150
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
