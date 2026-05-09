; DESCRIPTION: Creates a blue rectangular region at (306, 2) spanning 104 by 19 pixels.
; PLAN: r0=306(x), r1=2(y), r2=104(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 2
LDI r2, 104
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
