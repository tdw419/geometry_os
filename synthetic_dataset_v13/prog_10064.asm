; DESCRIPTION: Places a purple 10x117 rectangle at position (3, 53).
; PLAN: r0=3(x), r1=53(y), r2=10(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 53
LDI r2, 10
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
