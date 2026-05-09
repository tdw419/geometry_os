; DESCRIPTION: Renders a magenta disk with center (174, 172) and radius 45.
; PLAN: r0=174(x), r1=172(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 172
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
