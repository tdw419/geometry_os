; DESCRIPTION: Places a purple 37x88 rectangle at position (355, 59).
; PLAN: r0=355(x), r1=59(y), r2=37(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 59
LDI r2, 37
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
