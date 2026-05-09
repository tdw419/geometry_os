; DESCRIPTION: Places a black circle of radius 50 at center (401, 88).
; PLAN: r0=401(x), r1=88(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 88
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
