; DESCRIPTION: Places a blue 84x106 rectangle at position (172, 89).
; PLAN: r0=172(x), r1=89(y), r2=84(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 89
LDI r2, 84
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
