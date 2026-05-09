; DESCRIPTION: Places a white circle of radius 59 at center (401, 101).
; PLAN: r0=401(x), r1=101(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 101
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
