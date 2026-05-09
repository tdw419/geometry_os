; DESCRIPTION: Places a blue 74x106 rectangle at position (271, 122).
; PLAN: r0=271(x), r1=122(y), r2=74(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 122
LDI r2, 74
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
