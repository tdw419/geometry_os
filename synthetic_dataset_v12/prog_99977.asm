; DESCRIPTION: Places a blue 86x20 rectangle at position (232, 95).
; PLAN: r0=232(x), r1=95(y), r2=86(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 95
LDI r2, 86
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
