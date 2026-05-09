; DESCRIPTION: Places a blue 46x106 rectangle at position (138, 35).
; PLAN: r0=138(x), r1=35(y), r2=46(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 35
LDI r2, 46
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
