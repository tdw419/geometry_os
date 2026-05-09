; DESCRIPTION: Places a purple 76x13 rectangle at position (222, 155).
; PLAN: r0=222(x), r1=155(y), r2=76(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 155
LDI r2, 76
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
