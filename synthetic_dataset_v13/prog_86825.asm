; DESCRIPTION: Places a green 63x50 rectangle at position (97, 90).
; PLAN: r0=97(x), r1=90(y), r2=63(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 90
LDI r2, 63
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
