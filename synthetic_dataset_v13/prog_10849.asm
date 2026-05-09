; DESCRIPTION: Renders a magenta disk with center (392, 210) and radius 37.
; PLAN: r0=392(x), r1=210(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 210
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
