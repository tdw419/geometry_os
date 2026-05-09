; DESCRIPTION: Places a blue 54x67 rectangle at position (95, 140).
; PLAN: r0=95(x), r1=140(y), r2=54(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 140
LDI r2, 54
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
