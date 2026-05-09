; DESCRIPTION: Renders a magenta disk with center (46, 134) and radius 32.
; PLAN: r0=46(x), r1=134(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 134
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
