; DESCRIPTION: Places a purple 21x105 rectangle at position (62, 105).
; PLAN: r0=62(x), r1=105(y), r2=21(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 105
LDI r2, 21
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
