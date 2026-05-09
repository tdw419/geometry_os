; DESCRIPTION: Places a purple 78x35 rectangle at position (359, 28).
; PLAN: r0=359(x), r1=28(y), r2=78(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 28
LDI r2, 78
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
