; DESCRIPTION: Places a blue 67x30 rectangle at position (30, 206).
; PLAN: r0=30(x), r1=206(y), r2=67(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 206
LDI r2, 67
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
