; DESCRIPTION: Creates a blue rectangular region at (300, 22) spanning 49 by 66 pixels.
; PLAN: r0=300(x), r1=22(y), r2=49(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 22
LDI r2, 49
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
