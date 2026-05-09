; DESCRIPTION: Creates a blue rectangular region at (204, 7) spanning 115 by 119 pixels.
; PLAN: r0=204(x), r1=7(y), r2=115(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 7
LDI r2, 115
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
