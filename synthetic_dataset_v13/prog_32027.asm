; DESCRIPTION: Places a purple 10x72 rectangle at position (278, 33).
; PLAN: r0=278(x), r1=33(y), r2=10(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 33
LDI r2, 10
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
