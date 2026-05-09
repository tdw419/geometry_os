; DESCRIPTION: Creates a blue rectangular region at (90, 78) spanning 96 by 24 pixels.
; PLAN: r0=90(x), r1=78(y), r2=96(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 78
LDI r2, 96
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
