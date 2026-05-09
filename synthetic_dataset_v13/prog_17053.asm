; DESCRIPTION: Creates a blue rectangular region at (144, 25) spanning 70 by 106 pixels.
; PLAN: r0=144(x), r1=25(y), r2=70(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 25
LDI r2, 70
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
