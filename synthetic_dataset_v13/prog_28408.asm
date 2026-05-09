; DESCRIPTION: Renders a magenta disk with center (392, 134) and radius 27.
; PLAN: r0=392(x), r1=134(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 134
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
