; DESCRIPTION: Places a blue 63x94 rectangle at position (126, 83).
; PLAN: r0=126(x), r1=83(y), r2=63(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 83
LDI r2, 63
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
