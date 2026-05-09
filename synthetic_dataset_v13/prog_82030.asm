; DESCRIPTION: Creates a blue rectangular region at (271, 94) spanning 104 by 119 pixels.
; PLAN: r0=271(x), r1=94(y), r2=104(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 94
LDI r2, 104
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
