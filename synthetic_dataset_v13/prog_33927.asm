; DESCRIPTION: Places a purple 55x118 rectangle at position (261, 40).
; PLAN: r0=261(x), r1=40(y), r2=55(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 40
LDI r2, 55
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
