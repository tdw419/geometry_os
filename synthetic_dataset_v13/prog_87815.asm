; DESCRIPTION: Places a blue 84x70 rectangle at position (93, 76).
; PLAN: r0=93(x), r1=76(y), r2=84(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 76
LDI r2, 84
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
