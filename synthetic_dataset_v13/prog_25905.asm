; DESCRIPTION: Creates a blue rectangular region at (57, 17) spanning 97 by 58 pixels.
; PLAN: r0=57(x), r1=17(y), r2=97(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 17
LDI r2, 97
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
