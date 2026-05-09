; DESCRIPTION: Creates a blue rectangular region at (84, 70) spanning 119 by 95 pixels.
; PLAN: r0=84(x), r1=70(y), r2=119(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 70
LDI r2, 119
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
