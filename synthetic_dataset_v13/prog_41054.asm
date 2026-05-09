; DESCRIPTION: Places a purple 84x76 rectangle at position (428, 179).
; PLAN: r0=428(x), r1=179(y), r2=84(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 179
LDI r2, 84
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
