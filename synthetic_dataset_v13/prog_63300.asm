; DESCRIPTION: Places a purple 36x113 rectangle at position (158, 116).
; PLAN: r0=158(x), r1=116(y), r2=36(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 116
LDI r2, 36
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
