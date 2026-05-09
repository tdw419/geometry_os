; DESCRIPTION: Places a purple 90x102 rectangle at position (13, 119).
; PLAN: r0=13(x), r1=119(y), r2=90(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 119
LDI r2, 90
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
