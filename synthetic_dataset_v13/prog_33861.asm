; DESCRIPTION: Places a purple 79x20 rectangle at position (62, 47).
; PLAN: r0=62(x), r1=47(y), r2=79(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 47
LDI r2, 79
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
