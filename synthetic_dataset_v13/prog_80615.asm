; DESCRIPTION: Creates a blue rectangular region at (376, 162) spanning 83 by 75 pixels.
; PLAN: r0=376(x), r1=162(y), r2=83(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 162
LDI r2, 83
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
