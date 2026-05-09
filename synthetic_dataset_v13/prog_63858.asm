; DESCRIPTION: Places a blue 53x89 rectangle at position (214, 124).
; PLAN: r0=214(x), r1=124(y), r2=53(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 124
LDI r2, 53
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
