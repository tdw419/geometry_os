; DESCRIPTION: Renders a magenta disk with center (276, 222) and radius 21.
; PLAN: r0=276(x), r1=222(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 222
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
