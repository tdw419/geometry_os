; DESCRIPTION: Creates a blue rectangular region at (390, 28) spanning 38 by 37 pixels.
; PLAN: r0=390(x), r1=28(y), r2=38(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 28
LDI r2, 38
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
