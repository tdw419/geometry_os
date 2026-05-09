; DESCRIPTION: Places a blue 30x87 rectangle at position (181, 105).
; PLAN: r0=181(x), r1=105(y), r2=30(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 105
LDI r2, 30
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
