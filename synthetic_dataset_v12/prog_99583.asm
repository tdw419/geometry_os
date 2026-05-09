; DESCRIPTION: Places a blue 26x36 rectangle at position (29, 35).
; PLAN: r0=29(x), r1=35(y), r2=26(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 35
LDI r2, 26
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
