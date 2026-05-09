; DESCRIPTION: Creates a blue rectangular region at (319, 218) spanning 47 by 14 pixels.
; PLAN: r0=319(x), r1=218(y), r2=47(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 218
LDI r2, 47
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
