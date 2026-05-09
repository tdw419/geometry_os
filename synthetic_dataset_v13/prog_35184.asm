; DESCRIPTION: Places a purple 46x99 rectangle at position (381, 88).
; PLAN: r0=381(x), r1=88(y), r2=46(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 88
LDI r2, 46
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
