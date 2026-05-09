; DESCRIPTION: Places a purple 37x21 rectangle at position (101, 105).
; PLAN: r0=101(x), r1=105(y), r2=37(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 105
LDI r2, 37
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
