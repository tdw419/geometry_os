; DESCRIPTION: Places a magenta circle of radius 21 at center (401, 150).
; PLAN: r0=401(x), r1=150(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 150
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
