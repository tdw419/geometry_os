; DESCRIPTION: Places a white 97x70 rectangle at position (155, 163).
; PLAN: r0=155(x), r1=163(y), r2=97(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 163
LDI r2, 97
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
