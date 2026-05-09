; DESCRIPTION: Renders a magenta disk with center (46, 207) and radius 33.
; PLAN: r0=46(x), r1=207(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 207
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
