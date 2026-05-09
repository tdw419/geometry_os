; DESCRIPTION: Places a purple 90x96 rectangle at position (44, 34).
; PLAN: r0=44(x), r1=34(y), r2=90(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 34
LDI r2, 90
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
