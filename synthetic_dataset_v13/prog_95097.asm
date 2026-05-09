; DESCRIPTION: Renders a magenta disk with center (130, 111) and radius 68.
; PLAN: r0=130(x), r1=111(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 111
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
