; DESCRIPTION: Places a blue 23x116 rectangle at position (149, 94).
; PLAN: r0=149(x), r1=94(y), r2=23(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 94
LDI r2, 23
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
