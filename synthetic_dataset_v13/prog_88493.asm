; DESCRIPTION: Places a purple 80x92 rectangle at position (239, 67).
; PLAN: r0=239(x), r1=67(y), r2=80(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 67
LDI r2, 80
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
