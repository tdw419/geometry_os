; DESCRIPTION: Creates a blue rectangular region at (124, 20) spanning 49 by 70 pixels.
; PLAN: r0=124(x), r1=20(y), r2=49(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 20
LDI r2, 49
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
