; DESCRIPTION: Places a blue 79x30 rectangle at position (163, 149).
; PLAN: r0=163(x), r1=149(y), r2=79(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 149
LDI r2, 79
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
