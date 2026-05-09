; DESCRIPTION: Places a purple 64x69 rectangle at position (424, 69).
; PLAN: r0=424(x), r1=69(y), r2=64(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 69
LDI r2, 64
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
