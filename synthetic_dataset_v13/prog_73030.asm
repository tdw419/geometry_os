; DESCRIPTION: Creates a blue rectangular region at (6, 30) spanning 104 by 62 pixels.
; PLAN: r0=6(x), r1=30(y), r2=104(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 30
LDI r2, 104
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
