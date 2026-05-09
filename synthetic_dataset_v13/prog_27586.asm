; DESCRIPTION: Places a blue 115x88 rectangle at position (90, 168).
; PLAN: r0=90(x), r1=168(y), r2=115(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 168
LDI r2, 115
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
