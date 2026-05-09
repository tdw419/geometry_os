; DESCRIPTION: Places a purple 67x57 rectangle at position (40, 52).
; PLAN: r0=40(x), r1=52(y), r2=67(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 52
LDI r2, 67
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
