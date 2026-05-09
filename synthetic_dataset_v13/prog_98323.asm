; DESCRIPTION: Renders a magenta disk with center (105, 146) and radius 72.
; PLAN: r0=105(x), r1=146(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 146
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
