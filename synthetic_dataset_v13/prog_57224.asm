; DESCRIPTION: Places a purple 43x115 rectangle at position (74, 110).
; PLAN: r0=74(x), r1=110(y), r2=43(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 110
LDI r2, 43
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
