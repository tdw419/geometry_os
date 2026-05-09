; DESCRIPTION: Creates a blue rectangular region at (122, 104) spanning 92 by 55 pixels.
; PLAN: r0=122(x), r1=104(y), r2=92(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 104
LDI r2, 92
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
