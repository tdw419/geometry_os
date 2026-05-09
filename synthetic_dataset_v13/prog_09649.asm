; DESCRIPTION: Places a blue 119x117 rectangle at position (349, 135).
; PLAN: r0=349(x), r1=135(y), r2=119(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 135
LDI r2, 119
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
