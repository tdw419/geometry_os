; DESCRIPTION: Creates a blue rectangular region at (318, 118) spanning 79 by 101 pixels.
; PLAN: r0=318(x), r1=118(y), r2=79(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 118
LDI r2, 79
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
