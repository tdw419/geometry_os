; DESCRIPTION: Places a purple 49x79 rectangle at position (121, 71).
; PLAN: r0=121(x), r1=71(y), r2=49(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 71
LDI r2, 49
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
