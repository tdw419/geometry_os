; DESCRIPTION: Creates a blue rectangular region at (243, 110) spanning 119 by 97 pixels.
; PLAN: r0=243(x), r1=110(y), r2=119(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 110
LDI r2, 119
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
