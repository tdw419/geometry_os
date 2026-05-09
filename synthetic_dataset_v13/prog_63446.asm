; DESCRIPTION: Creates a blue rectangular region at (79, 66) spanning 14 by 119 pixels.
; PLAN: r0=79(x), r1=66(y), r2=14(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 66
LDI r2, 14
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
