; DESCRIPTION: Creates a blue rectangular region at (80, 14) spanning 78 by 98 pixels.
; PLAN: r0=80(x), r1=14(y), r2=78(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 14
LDI r2, 78
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
