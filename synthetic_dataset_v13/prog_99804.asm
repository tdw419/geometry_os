; DESCRIPTION: Places a purple 116x10 rectangle at position (185, 135).
; PLAN: r0=185(x), r1=135(y), r2=116(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 135
LDI r2, 116
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
