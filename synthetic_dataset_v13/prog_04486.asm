; DESCRIPTION: Places a purple 43x87 rectangle at position (132, 67).
; PLAN: r0=132(x), r1=67(y), r2=43(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 67
LDI r2, 43
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
