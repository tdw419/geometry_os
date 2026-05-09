; DESCRIPTION: Places a purple 59x88 rectangle at position (43, 87).
; PLAN: r0=43(x), r1=87(y), r2=59(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 87
LDI r2, 59
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
