; DESCRIPTION: Creates a blue rectangular region at (319, 7) spanning 57 by 106 pixels.
; PLAN: r0=319(x), r1=7(y), r2=57(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 7
LDI r2, 57
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
