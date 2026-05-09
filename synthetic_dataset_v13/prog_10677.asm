; DESCRIPTION: Renders a magenta disk with center (296, 66) and radius 50.
; PLAN: r0=296(x), r1=66(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 66
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
