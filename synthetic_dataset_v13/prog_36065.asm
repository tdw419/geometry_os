; DESCRIPTION: Places a purple 10x88 rectangle at position (370, 139).
; PLAN: r0=370(x), r1=139(y), r2=10(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 139
LDI r2, 10
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
