; DESCRIPTION: Places a purple 108x71 rectangle at position (37, 157).
; PLAN: r0=37(x), r1=157(y), r2=108(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 157
LDI r2, 108
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
