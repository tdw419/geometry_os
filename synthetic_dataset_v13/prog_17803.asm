; DESCRIPTION: Places a purple 26x74 rectangle at position (31, 60).
; PLAN: r0=31(x), r1=60(y), r2=26(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 60
LDI r2, 26
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
