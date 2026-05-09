; DESCRIPTION: Creates a blue rectangular region at (314, 86) spanning 66 by 90 pixels.
; PLAN: r0=314(x), r1=86(y), r2=66(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 86
LDI r2, 66
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
