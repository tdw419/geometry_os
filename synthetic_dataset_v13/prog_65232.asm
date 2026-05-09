; DESCRIPTION: Renders a magenta disk with center (180, 191) and radius 24.
; PLAN: r0=180(x), r1=191(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 191
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
