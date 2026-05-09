; DESCRIPTION: Places a purple 44x119 rectangle at position (337, 25).
; PLAN: r0=337(x), r1=25(y), r2=44(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 25
LDI r2, 44
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
