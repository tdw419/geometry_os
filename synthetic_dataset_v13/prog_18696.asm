; DESCRIPTION: Creates a blue rectangular region at (84, 25) spanning 68 by 110 pixels.
; PLAN: r0=84(x), r1=25(y), r2=68(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 25
LDI r2, 68
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
