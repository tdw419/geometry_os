; DESCRIPTION: Places a blue 19x116 rectangle at position (359, 22).
; PLAN: r0=359(x), r1=22(y), r2=19(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 22
LDI r2, 19
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
