; DESCRIPTION: Creates a blue rectangular region at (88, 65) spanning 56 by 79 pixels.
; PLAN: r0=88(x), r1=65(y), r2=56(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 65
LDI r2, 56
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
