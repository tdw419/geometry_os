; DESCRIPTION: Places a purple 54x60 rectangle at position (423, 106).
; PLAN: r0=423(x), r1=106(y), r2=54(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 106
LDI r2, 54
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
