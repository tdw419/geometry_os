; DESCRIPTION: Places a purple 28x89 rectangle at position (158, 153).
; PLAN: r0=158(x), r1=153(y), r2=28(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 153
LDI r2, 28
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
