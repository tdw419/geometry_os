; DESCRIPTION: Places a magenta 80x108 rectangle at position (230, 121).
; PLAN: r0=230(x), r1=121(y), r2=80(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 121
LDI r2, 80
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
