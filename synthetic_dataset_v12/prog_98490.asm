; DESCRIPTION: Places a purple 72x119 rectangle at position (428, 83).
; PLAN: r0=428(x), r1=83(y), r2=72(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 83
LDI r2, 72
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
