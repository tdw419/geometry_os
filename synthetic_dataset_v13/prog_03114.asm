; DESCRIPTION: Creates a blue rectangular region at (15, 65) spanning 104 by 101 pixels.
; PLAN: r0=15(x), r1=65(y), r2=104(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 65
LDI r2, 104
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
