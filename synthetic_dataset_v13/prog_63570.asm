; DESCRIPTION: Creates a blue rectangular region at (321, 84) spanning 71 by 71 pixels.
; PLAN: r0=321(x), r1=84(y), r2=71(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 84
LDI r2, 71
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
