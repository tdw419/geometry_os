; DESCRIPTION: Renders a magenta disk with center (401, 137) and radius 57.
; PLAN: r0=401(x), r1=137(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 137
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
