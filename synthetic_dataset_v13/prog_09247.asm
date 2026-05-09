; DESCRIPTION: Places a purple 67x96 rectangle at position (94, 95).
; PLAN: r0=94(x), r1=95(y), r2=67(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 95
LDI r2, 67
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
