; DESCRIPTION: Places a purple 106x96 rectangle at position (255, 67).
; PLAN: r0=255(x), r1=67(y), r2=106(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 67
LDI r2, 106
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
