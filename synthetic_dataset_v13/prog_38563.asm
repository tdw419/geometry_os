; DESCRIPTION: Places a blue 77x97 rectangle at position (128, 134).
; PLAN: r0=128(x), r1=134(y), r2=77(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 134
LDI r2, 77
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
