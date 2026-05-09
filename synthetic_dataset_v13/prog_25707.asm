; DESCRIPTION: Places a purple 67x69 rectangle at position (220, 173).
; PLAN: r0=220(x), r1=173(y), r2=67(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 173
LDI r2, 67
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
