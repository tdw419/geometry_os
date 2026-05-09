; DESCRIPTION: Places a blue 108x76 rectangle at position (80, 110).
; PLAN: r0=80(x), r1=110(y), r2=108(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 110
LDI r2, 108
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
