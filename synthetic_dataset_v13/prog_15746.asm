; DESCRIPTION: Renders a magenta disk with center (21, 53) and radius 16.
; PLAN: r0=21(x), r1=53(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 53
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
