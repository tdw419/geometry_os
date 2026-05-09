; DESCRIPTION: Creates a blue rectangular region at (437, 124) spanning 49 by 78 pixels.
; PLAN: r0=437(x), r1=124(y), r2=49(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 124
LDI r2, 49
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
