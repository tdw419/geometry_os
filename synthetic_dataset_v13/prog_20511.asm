; DESCRIPTION: Places a blue 118x22 rectangle at position (6, 113).
; PLAN: r0=6(x), r1=113(y), r2=118(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 113
LDI r2, 118
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
