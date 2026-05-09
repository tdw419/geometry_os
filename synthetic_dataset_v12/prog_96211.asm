; DESCRIPTION: Renders a magenta disk with center (437, 178) and radius 58.
; PLAN: r0=437(x), r1=178(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 178
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
