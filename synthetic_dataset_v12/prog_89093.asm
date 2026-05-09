; DESCRIPTION: Creates a blue rectangular region at (110, 72) spanning 19 by 35 pixels.
; PLAN: r0=110(x), r1=72(y), r2=19(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 72
LDI r2, 19
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
