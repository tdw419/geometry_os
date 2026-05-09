; DESCRIPTION: Creates a yellow rectangular region at (255, 155) spanning 119 by 51 pixels.
; PLAN: r0=255(x), r1=155(y), r2=119(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 155
LDI r2, 119
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
