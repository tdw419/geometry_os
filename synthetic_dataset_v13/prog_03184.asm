; DESCRIPTION: Creates a blue rectangular region at (43, 7) spanning 108 by 104 pixels.
; PLAN: r0=43(x), r1=7(y), r2=108(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 7
LDI r2, 108
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
