; DESCRIPTION: Creates a blue rectangular region at (376, 30) spanning 104 by 22 pixels.
; PLAN: r0=376(x), r1=30(y), r2=104(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 30
LDI r2, 104
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
