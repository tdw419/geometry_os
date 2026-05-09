; DESCRIPTION: Places a blue 90x54 rectangle at position (258, 166).
; PLAN: r0=258(x), r1=166(y), r2=90(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 166
LDI r2, 90
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
