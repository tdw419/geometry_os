; DESCRIPTION: Renders a magenta disk with center (344, 89) and radius 44.
; PLAN: r0=344(x), r1=89(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 89
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
