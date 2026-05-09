; DESCRIPTION: Places a purple 90x67 rectangle at position (262, 89).
; PLAN: r0=262(x), r1=89(y), r2=90(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 89
LDI r2, 90
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
