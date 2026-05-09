; DESCRIPTION: Creates a green rectangular region at (395, 139) spanning 104 by 29 pixels.
; PLAN: r0=395(x), r1=139(y), r2=104(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 139
LDI r2, 104
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
