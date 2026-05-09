; DESCRIPTION: Creates a blue rectangular region at (364, 170) spanning 50 by 47 pixels.
; PLAN: r0=364(x), r1=170(y), r2=50(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 170
LDI r2, 50
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
