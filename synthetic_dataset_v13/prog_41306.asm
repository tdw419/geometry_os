; DESCRIPTION: Places a purple 108x106 rectangle at position (386, 70).
; PLAN: r0=386(x), r1=70(y), r2=108(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 70
LDI r2, 108
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
