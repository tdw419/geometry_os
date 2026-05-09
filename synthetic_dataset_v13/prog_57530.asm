; DESCRIPTION: Renders a purple disk with center (401, 61) and radius 57.
; PLAN: r0=401(x), r1=61(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 61
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
