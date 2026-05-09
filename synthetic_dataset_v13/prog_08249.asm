; DESCRIPTION: Creates a blue rectangular region at (208, 121) spanning 78 by 30 pixels.
; PLAN: r0=208(x), r1=121(y), r2=78(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 121
LDI r2, 78
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
