; DESCRIPTION: Places a purple 73x85 rectangle at position (169, 97).
; PLAN: r0=169(x), r1=97(y), r2=73(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 97
LDI r2, 73
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
