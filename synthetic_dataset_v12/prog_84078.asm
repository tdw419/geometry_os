; DESCRIPTION: Places a purple 88x35 rectangle at position (159, 36).
; PLAN: r0=159(x), r1=36(y), r2=88(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 36
LDI r2, 88
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
