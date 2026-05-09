; DESCRIPTION: Renders a magenta disk with center (281, 161) and radius 56.
; PLAN: r0=281(x), r1=161(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 161
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
