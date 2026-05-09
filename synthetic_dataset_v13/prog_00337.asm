; DESCRIPTION: Places a purple 19x97 rectangle at position (74, 70).
; PLAN: r0=74(x), r1=70(y), r2=19(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 70
LDI r2, 19
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
