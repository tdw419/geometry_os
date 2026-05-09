; DESCRIPTION: Creates a yellow rectangular region at (389, 139) spanning 66 by 104 pixels.
; PLAN: r0=389(x), r1=139(y), r2=66(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 139
LDI r2, 66
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
