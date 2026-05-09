; DESCRIPTION: Places a magenta circle of radius 38 at center (401, 216).
; PLAN: r0=401(x), r1=216(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 216
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
