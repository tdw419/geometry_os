; DESCRIPTION: Places a purple 74x12 rectangle at position (332, 5).
; PLAN: r0=332(x), r1=5(y), r2=74(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 5
LDI r2, 74
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
