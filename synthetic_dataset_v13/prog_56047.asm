; DESCRIPTION: Places a blue 87x67 rectangle at position (291, 176).
; PLAN: r0=291(x), r1=176(y), r2=87(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 176
LDI r2, 87
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
