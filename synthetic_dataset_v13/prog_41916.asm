; DESCRIPTION: Places a blue 43x108 rectangle at position (155, 103).
; PLAN: r0=155(x), r1=103(y), r2=43(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 103
LDI r2, 43
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
