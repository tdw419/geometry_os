; DESCRIPTION: Places a purple 28x99 rectangle at position (484, 30).
; PLAN: r0=484(x), r1=30(y), r2=28(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 30
LDI r2, 28
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
