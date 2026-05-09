; DESCRIPTION: Renders a magenta disk with center (387, 191) and radius 65.
; PLAN: r0=387(x), r1=191(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 191
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
