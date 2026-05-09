; DESCRIPTION: Creates a blue rectangular region at (375, 104) spanning 11 by 106 pixels.
; PLAN: r0=375(x), r1=104(y), r2=11(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 104
LDI r2, 11
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
