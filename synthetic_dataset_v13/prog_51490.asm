; DESCRIPTION: Creates a blue rectangular region at (342, 104) spanning 31 by 103 pixels.
; PLAN: r0=342(x), r1=104(y), r2=31(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 104
LDI r2, 31
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
