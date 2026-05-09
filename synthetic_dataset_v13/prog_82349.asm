; DESCRIPTION: Creates a blue rectangular region at (62, 132) spanning 89 by 120 pixels.
; PLAN: r0=62(x), r1=132(y), r2=89(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 132
LDI r2, 89
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
