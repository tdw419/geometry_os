; DESCRIPTION: Places a purple 49x74 rectangle at position (424, 182).
; PLAN: r0=424(x), r1=182(y), r2=49(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 182
LDI r2, 49
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
