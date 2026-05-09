; DESCRIPTION: Creates a blue rectangular region at (155, 71) spanning 62 by 34 pixels.
; PLAN: r0=155(x), r1=71(y), r2=62(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 71
LDI r2, 62
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
