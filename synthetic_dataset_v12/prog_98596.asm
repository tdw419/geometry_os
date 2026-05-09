; DESCRIPTION: Places a blue 61x80 rectangle at position (132, 158).
; PLAN: r0=132(x), r1=158(y), r2=61(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 158
LDI r2, 61
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
