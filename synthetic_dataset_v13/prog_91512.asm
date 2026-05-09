; DESCRIPTION: Creates a blue rectangular region at (407, 124) spanning 38 by 110 pixels.
; PLAN: r0=407(x), r1=124(y), r2=38(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 124
LDI r2, 38
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
