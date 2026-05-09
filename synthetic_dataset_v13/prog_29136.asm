; DESCRIPTION: Places a blue 75x44 rectangle at position (97, 207).
; PLAN: r0=97(x), r1=207(y), r2=75(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 207
LDI r2, 75
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
