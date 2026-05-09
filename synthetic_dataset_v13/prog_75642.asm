; DESCRIPTION: Creates a blue rectangular region at (25, 216) spanning 23 by 35 pixels.
; PLAN: r0=25(x), r1=216(y), r2=23(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 216
LDI r2, 23
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
