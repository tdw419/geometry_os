; DESCRIPTION: Places a blue 96x97 rectangle at position (207, 126).
; PLAN: r0=207(x), r1=126(y), r2=96(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 126
LDI r2, 96
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
