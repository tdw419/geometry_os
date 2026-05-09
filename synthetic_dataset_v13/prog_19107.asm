; DESCRIPTION: Places a purple 104x54 rectangle at position (101, 135).
; PLAN: r0=101(x), r1=135(y), r2=104(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 135
LDI r2, 104
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
