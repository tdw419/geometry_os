; DESCRIPTION: Places a blue 114x14 rectangle at position (319, 128).
; PLAN: r0=319(x), r1=128(y), r2=114(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 128
LDI r2, 114
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
