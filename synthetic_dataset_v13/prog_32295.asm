; DESCRIPTION: Creates a blue rectangular region at (390, 15) spanning 55 by 98 pixels.
; PLAN: r0=390(x), r1=15(y), r2=55(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 15
LDI r2, 55
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
