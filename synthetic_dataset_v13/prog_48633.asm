; DESCRIPTION: Renders a magenta disk with center (392, 201) and radius 48.
; PLAN: r0=392(x), r1=201(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 201
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
