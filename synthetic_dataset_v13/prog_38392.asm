; DESCRIPTION: Places a blue 108x93 rectangle at position (161, 22).
; PLAN: r0=161(x), r1=22(y), r2=108(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 22
LDI r2, 108
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
