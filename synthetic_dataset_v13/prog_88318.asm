; DESCRIPTION: Places a purple 88x72 rectangle at position (202, 3).
; PLAN: r0=202(x), r1=3(y), r2=88(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 3
LDI r2, 88
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
