; DESCRIPTION: Places a blue 75x23 rectangle at position (149, 188).
; PLAN: r0=149(x), r1=188(y), r2=75(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 188
LDI r2, 75
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
