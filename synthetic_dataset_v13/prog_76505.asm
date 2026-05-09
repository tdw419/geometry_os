; DESCRIPTION: Places a blue circle of radius 42 at center (401, 80).
; PLAN: r0=401(x), r1=80(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 80
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
