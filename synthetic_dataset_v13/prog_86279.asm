; DESCRIPTION: Places a purple 35x88 rectangle at position (47, 144).
; PLAN: r0=47(x), r1=144(y), r2=35(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 144
LDI r2, 35
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
