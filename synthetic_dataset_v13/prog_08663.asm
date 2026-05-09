; DESCRIPTION: Places a blue 56x108 rectangle at position (163, 25).
; PLAN: r0=163(x), r1=25(y), r2=56(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 25
LDI r2, 56
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
