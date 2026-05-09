; DESCRIPTION: Places a blue 57x49 rectangle at position (103, 74).
; PLAN: r0=103(x), r1=74(y), r2=57(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 74
LDI r2, 57
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
