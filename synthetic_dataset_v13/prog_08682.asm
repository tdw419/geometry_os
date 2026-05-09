; DESCRIPTION: Creates a blue rectangular region at (351, 54) spanning 82 by 104 pixels.
; PLAN: r0=351(x), r1=54(y), r2=82(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 54
LDI r2, 82
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
