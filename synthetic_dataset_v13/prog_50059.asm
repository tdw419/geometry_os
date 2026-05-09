; DESCRIPTION: Places a purple 90x15 rectangle at position (416, 0).
; PLAN: r0=416(x), r1=0(y), r2=90(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 0
LDI r2, 90
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
