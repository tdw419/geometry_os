; DESCRIPTION: Places a blue 84x31 rectangle at position (317, 108).
; PLAN: r0=317(x), r1=108(y), r2=84(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 108
LDI r2, 84
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
