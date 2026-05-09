; DESCRIPTION: Places a orange 23x84 rectangle at position (317, 70).
; PLAN: r0=317(x), r1=70(y), r2=23(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 70
LDI r2, 23
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
