; DESCRIPTION: Renders a magenta disk with center (401, 104) and radius 59.
; PLAN: r0=401(x), r1=104(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 104
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
