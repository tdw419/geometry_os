; DESCRIPTION: Creates a green circular shape at (401, 133) with radius 72.
; PLAN: r0=401(x), r1=133(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 133
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
