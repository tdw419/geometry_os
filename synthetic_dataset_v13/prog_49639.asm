; DESCRIPTION: Creates a blue rectangular region at (191, 57) spanning 99 by 84 pixels.
; PLAN: r0=191(x), r1=57(y), r2=99(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 57
LDI r2, 99
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
