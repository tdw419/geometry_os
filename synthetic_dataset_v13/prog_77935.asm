; DESCRIPTION: Places a purple 81x22 rectangle at position (161, 178).
; PLAN: r0=161(x), r1=178(y), r2=81(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 178
LDI r2, 81
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
