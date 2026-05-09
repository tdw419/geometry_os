; DESCRIPTION: Renders a magenta disk with center (187, 55) and radius 38.
; PLAN: r0=187(x), r1=55(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 55
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
