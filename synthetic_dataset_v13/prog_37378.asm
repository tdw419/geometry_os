; DESCRIPTION: Places a blue 74x68 rectangle at position (60, 118).
; PLAN: r0=60(x), r1=118(y), r2=74(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 118
LDI r2, 74
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
