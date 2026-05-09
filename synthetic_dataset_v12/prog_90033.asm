; DESCRIPTION: Places a blue 118x83 rectangle at position (133, 29).
; PLAN: r0=133(x), r1=29(y), r2=118(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 29
LDI r2, 118
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
