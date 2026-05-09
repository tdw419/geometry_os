; DESCRIPTION: Places a purple 88x22 rectangle at position (344, 200).
; PLAN: r0=344(x), r1=200(y), r2=88(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 200
LDI r2, 88
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
