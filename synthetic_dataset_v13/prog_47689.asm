; DESCRIPTION: Creates a blue rectangular region at (318, 29) spanning 100 by 72 pixels.
; PLAN: r0=318(x), r1=29(y), r2=100(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 29
LDI r2, 100
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
