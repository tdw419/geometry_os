; DESCRIPTION: Creates a blue rectangular region at (54, 155) spanning 71 by 17 pixels.
; PLAN: r0=54(x), r1=155(y), r2=71(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 155
LDI r2, 71
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
