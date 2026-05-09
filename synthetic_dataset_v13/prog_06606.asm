; DESCRIPTION: Places a red circle of radius 67 at center (401, 179).
; PLAN: r0=401(x), r1=179(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 179
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
