; DESCRIPTION: Renders a magenta disk with center (276, 135) and radius 33.
; PLAN: r0=276(x), r1=135(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 135
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
