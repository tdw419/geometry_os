; DESCRIPTION: Creates a blue rectangular region at (98, 20) spanning 95 by 119 pixels.
; PLAN: r0=98(x), r1=20(y), r2=95(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 20
LDI r2, 95
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
