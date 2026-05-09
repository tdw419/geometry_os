; DESCRIPTION: Creates a blue rectangular region at (49, 84) spanning 117 by 15 pixels.
; PLAN: r0=49(x), r1=84(y), r2=117(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 84
LDI r2, 117
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
