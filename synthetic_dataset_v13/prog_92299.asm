; DESCRIPTION: Creates a blue rectangular region at (325, 140) spanning 95 by 15 pixels.
; PLAN: r0=325(x), r1=140(y), r2=95(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 140
LDI r2, 95
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
