; DESCRIPTION: Places a blue 97x10 rectangle at position (155, 127).
; PLAN: r0=155(x), r1=127(y), r2=97(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 127
LDI r2, 97
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
