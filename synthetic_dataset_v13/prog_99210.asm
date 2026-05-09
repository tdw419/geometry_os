; DESCRIPTION: Places a blue 114x12 rectangle at position (28, 198).
; PLAN: r0=28(x), r1=198(y), r2=114(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 198
LDI r2, 114
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
