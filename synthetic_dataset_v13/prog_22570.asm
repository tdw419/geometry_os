; DESCRIPTION: Places a blue 88x10 rectangle at position (417, 198).
; PLAN: r0=417(x), r1=198(y), r2=88(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 198
LDI r2, 88
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
