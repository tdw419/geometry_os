; DESCRIPTION: Places a purple 70x34 rectangle at position (99, 95).
; PLAN: r0=99(x), r1=95(y), r2=70(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 95
LDI r2, 70
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
