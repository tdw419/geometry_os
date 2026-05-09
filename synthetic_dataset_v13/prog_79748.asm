; DESCRIPTION: Creates a blue rectangular region at (142, 156) spanning 22 by 45 pixels.
; PLAN: r0=142(x), r1=156(y), r2=22(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 156
LDI r2, 22
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
