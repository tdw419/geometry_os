; DESCRIPTION: Creates a blue rectangular region at (372, 170) spanning 105 by 40 pixels.
; PLAN: r0=372(x), r1=170(y), r2=105(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 170
LDI r2, 105
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
