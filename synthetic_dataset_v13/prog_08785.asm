; DESCRIPTION: Places a purple 68x78 rectangle at position (279, 62).
; PLAN: r0=279(x), r1=62(y), r2=68(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 62
LDI r2, 68
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
