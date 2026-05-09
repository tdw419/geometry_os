; DESCRIPTION: Renders a magenta disk with center (411, 187) and radius 45.
; PLAN: r0=411(x), r1=187(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 187
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
