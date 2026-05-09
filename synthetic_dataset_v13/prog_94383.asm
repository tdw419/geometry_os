; DESCRIPTION: Creates a blue rectangular region at (149, 232) spanning 71 by 20 pixels.
; PLAN: r0=149(x), r1=232(y), r2=71(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 232
LDI r2, 71
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
