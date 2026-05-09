; DESCRIPTION: Renders a magenta disk with center (178, 135) and radius 77.
; PLAN: r0=178(x), r1=135(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 135
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
