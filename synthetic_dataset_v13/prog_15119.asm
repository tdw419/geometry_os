; DESCRIPTION: Places a blue 29x56 rectangle at position (132, 113).
; PLAN: r0=132(x), r1=113(y), r2=29(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 113
LDI r2, 29
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
