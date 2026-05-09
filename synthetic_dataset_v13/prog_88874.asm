; DESCRIPTION: Creates a blue rectangular region at (163, 106) spanning 109 by 78 pixels.
; PLAN: r0=163(x), r1=106(y), r2=109(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 106
LDI r2, 109
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
