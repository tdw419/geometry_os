; DESCRIPTION: Places a blue 97x25 rectangle at position (272, 79).
; PLAN: r0=272(x), r1=79(y), r2=97(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 79
LDI r2, 97
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
