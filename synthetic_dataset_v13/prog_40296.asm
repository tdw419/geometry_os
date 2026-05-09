; DESCRIPTION: Creates a blue rectangular region at (319, 37) spanning 78 by 109 pixels.
; PLAN: r0=319(x), r1=37(y), r2=78(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 37
LDI r2, 78
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
