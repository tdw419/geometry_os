; DESCRIPTION: Creates a blue rectangular region at (408, 155) spanning 81 by 96 pixels.
; PLAN: r0=408(x), r1=155(y), r2=81(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 155
LDI r2, 81
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
