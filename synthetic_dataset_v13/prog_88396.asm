; DESCRIPTION: Places a purple 90x116 rectangle at position (337, 110).
; PLAN: r0=337(x), r1=110(y), r2=90(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 110
LDI r2, 90
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
