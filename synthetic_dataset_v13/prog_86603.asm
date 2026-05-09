; DESCRIPTION: Creates a yellow rectangular region at (84, 155) spanning 96 by 58 pixels.
; PLAN: r0=84(x), r1=155(y), r2=96(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 155
LDI r2, 96
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
