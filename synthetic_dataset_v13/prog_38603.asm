; DESCRIPTION: Places a blue 114x96 rectangle at position (350, 122).
; PLAN: r0=350(x), r1=122(y), r2=114(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 122
LDI r2, 114
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
