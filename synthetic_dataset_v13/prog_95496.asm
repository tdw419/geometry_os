; DESCRIPTION: Places a blue 21x67 rectangle at position (304, 166).
; PLAN: r0=304(x), r1=166(y), r2=21(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 166
LDI r2, 21
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
