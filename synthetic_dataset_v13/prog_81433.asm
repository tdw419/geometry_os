; DESCRIPTION: Creates a blue rectangular region at (410, 86) spanning 54 by 119 pixels.
; PLAN: r0=410(x), r1=86(y), r2=54(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 86
LDI r2, 54
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
