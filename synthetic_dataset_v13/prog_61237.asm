; DESCRIPTION: Places a blue 67x116 rectangle at position (325, 80).
; PLAN: r0=325(x), r1=80(y), r2=67(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 80
LDI r2, 67
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
