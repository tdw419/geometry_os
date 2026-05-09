; DESCRIPTION: Creates a blue rectangular region at (408, 108) spanning 104 by 58 pixels.
; PLAN: r0=408(x), r1=108(y), r2=104(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 108
LDI r2, 104
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
