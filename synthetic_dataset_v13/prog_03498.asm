; DESCRIPTION: Places a purple 65x88 rectangle at position (431, 33).
; PLAN: r0=431(x), r1=33(y), r2=65(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 33
LDI r2, 65
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
