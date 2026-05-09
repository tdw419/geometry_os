; DESCRIPTION: Places a purple 29x89 rectangle at position (271, 45).
; PLAN: r0=271(x), r1=45(y), r2=29(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 45
LDI r2, 29
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
