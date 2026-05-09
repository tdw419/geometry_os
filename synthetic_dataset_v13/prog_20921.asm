; DESCRIPTION: Places a purple 64x102 rectangle at position (43, 110).
; PLAN: r0=43(x), r1=110(y), r2=64(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 110
LDI r2, 64
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
