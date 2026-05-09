; DESCRIPTION: Creates a blue rectangular region at (162, 84) spanning 46 by 118 pixels.
; PLAN: r0=162(x), r1=84(y), r2=46(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 84
LDI r2, 46
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
