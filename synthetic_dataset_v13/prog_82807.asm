; DESCRIPTION: Creates a blue rectangular region at (376, 207) spanning 83 by 25 pixels.
; PLAN: r0=376(x), r1=207(y), r2=83(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 207
LDI r2, 83
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
