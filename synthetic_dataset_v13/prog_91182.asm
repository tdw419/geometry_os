; DESCRIPTION: Places a purple 73x104 rectangle at position (306, 58).
; PLAN: r0=306(x), r1=58(y), r2=73(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 58
LDI r2, 73
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
