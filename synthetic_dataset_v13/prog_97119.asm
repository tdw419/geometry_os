; DESCRIPTION: Places a blue 117x42 rectangle at position (132, 135).
; PLAN: r0=132(x), r1=135(y), r2=117(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 135
LDI r2, 117
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
