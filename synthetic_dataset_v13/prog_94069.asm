; DESCRIPTION: Renders a magenta disk with center (342, 161) and radius 66.
; PLAN: r0=342(x), r1=161(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 161
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
