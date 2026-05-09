; DESCRIPTION: Places a purple 119x47 rectangle at position (231, 69).
; PLAN: r0=231(x), r1=69(y), r2=119(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 69
LDI r2, 119
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
