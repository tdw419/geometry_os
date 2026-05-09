; DESCRIPTION: Places a blue 70x23 rectangle at position (68, 121).
; PLAN: r0=68(x), r1=121(y), r2=70(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 121
LDI r2, 70
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
