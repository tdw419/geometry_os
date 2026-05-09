; DESCRIPTION: Places a purple 25x15 rectangle at position (231, 34).
; PLAN: r0=231(x), r1=34(y), r2=25(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 34
LDI r2, 25
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
