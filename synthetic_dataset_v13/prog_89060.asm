; DESCRIPTION: Places a purple 99x88 rectangle at position (141, 21).
; PLAN: r0=141(x), r1=21(y), r2=99(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 21
LDI r2, 99
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
