; DESCRIPTION: Places a green 97x13 rectangle at position (90, 103).
; PLAN: r0=90(x), r1=103(y), r2=97(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 103
LDI r2, 97
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
