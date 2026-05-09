; DESCRIPTION: Renders a magenta disk with center (143, 166) and radius 65.
; PLAN: r0=143(x), r1=166(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 166
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
