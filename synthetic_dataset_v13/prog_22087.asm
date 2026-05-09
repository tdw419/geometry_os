; DESCRIPTION: Places a purple 74x69 rectangle at position (43, 136).
; PLAN: r0=43(x), r1=136(y), r2=74(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 136
LDI r2, 74
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
