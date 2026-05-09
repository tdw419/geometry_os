; DESCRIPTION: Places a blue 97x77 rectangle at position (192, 178).
; PLAN: r0=192(x), r1=178(y), r2=97(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 178
LDI r2, 97
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
