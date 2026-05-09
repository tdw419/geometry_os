; DESCRIPTION: Creates a blue rectangular region at (283, 104) spanning 15 by 68 pixels.
; PLAN: r0=283(x), r1=104(y), r2=15(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 104
LDI r2, 15
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
