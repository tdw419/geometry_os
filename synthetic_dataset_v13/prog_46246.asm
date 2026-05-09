; DESCRIPTION: Places a blue 113x67 rectangle at position (258, 15).
; PLAN: r0=258(x), r1=15(y), r2=113(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 15
LDI r2, 113
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
