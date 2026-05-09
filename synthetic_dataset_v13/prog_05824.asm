; DESCRIPTION: Renders a magenta disk with center (313, 84) and radius 58.
; PLAN: r0=313(x), r1=84(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 84
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
