; DESCRIPTION: Places a purple 90x70 rectangle at position (270, 31).
; PLAN: r0=270(x), r1=31(y), r2=90(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 31
LDI r2, 90
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
