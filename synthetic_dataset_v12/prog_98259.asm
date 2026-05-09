; DESCRIPTION: Places a purple 19x113 rectangle at position (490, 116).
; PLAN: r0=490(x), r1=116(y), r2=19(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 116
LDI r2, 19
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
