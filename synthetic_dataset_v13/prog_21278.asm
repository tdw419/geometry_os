; DESCRIPTION: Places a purple 67x97 rectangle at position (58, 89).
; PLAN: r0=58(x), r1=89(y), r2=67(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 89
LDI r2, 67
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
