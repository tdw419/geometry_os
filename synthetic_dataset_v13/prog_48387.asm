; DESCRIPTION: Creates a blue rectangular region at (357, 108) spanning 80 by 52 pixels.
; PLAN: r0=357(x), r1=108(y), r2=80(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 108
LDI r2, 80
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
