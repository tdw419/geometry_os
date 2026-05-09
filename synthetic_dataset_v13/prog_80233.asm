; DESCRIPTION: Places a blue 86x36 rectangle at position (25, 147).
; PLAN: r0=25(x), r1=147(y), r2=86(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 147
LDI r2, 86
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
