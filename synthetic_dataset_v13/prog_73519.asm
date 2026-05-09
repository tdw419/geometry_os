; DESCRIPTION: Places a blue 49x88 rectangle at position (338, 117).
; PLAN: r0=338(x), r1=117(y), r2=49(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 117
LDI r2, 49
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
