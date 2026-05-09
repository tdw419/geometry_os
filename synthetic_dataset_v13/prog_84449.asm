; DESCRIPTION: Places a purple 79x68 rectangle at position (54, 157).
; PLAN: r0=54(x), r1=157(y), r2=79(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 157
LDI r2, 79
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
