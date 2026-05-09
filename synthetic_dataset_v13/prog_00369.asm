; DESCRIPTION: Places a blue 88x111 rectangle at position (416, 75).
; PLAN: r0=416(x), r1=75(y), r2=88(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 75
LDI r2, 88
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
