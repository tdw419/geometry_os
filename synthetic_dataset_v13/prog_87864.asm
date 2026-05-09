; DESCRIPTION: Places a green 97x109 rectangle at position (126, 56).
; PLAN: r0=126(x), r1=56(y), r2=97(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 56
LDI r2, 97
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
