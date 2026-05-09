; DESCRIPTION: Renders a magenta disk with center (135, 111) and radius 72.
; PLAN: r0=135(x), r1=111(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 111
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
