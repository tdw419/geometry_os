; DESCRIPTION: Places a blue 36x22 rectangle at position (351, 159).
; PLAN: r0=351(x), r1=159(y), r2=36(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 159
LDI r2, 36
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
