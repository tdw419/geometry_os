; DESCRIPTION: Creates a blue rectangular region at (119, 40) spanning 107 by 90 pixels.
; PLAN: r0=119(x), r1=40(y), r2=107(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 40
LDI r2, 107
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
