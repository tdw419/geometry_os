; DESCRIPTION: Places a blue 102x62 rectangle at position (70, 87).
; PLAN: r0=70(x), r1=87(y), r2=102(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 87
LDI r2, 102
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
