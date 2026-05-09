; DESCRIPTION: Places a blue 97x24 rectangle at position (373, 166).
; PLAN: r0=373(x), r1=166(y), r2=97(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 166
LDI r2, 97
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
