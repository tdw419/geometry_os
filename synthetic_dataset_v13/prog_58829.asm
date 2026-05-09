; DESCRIPTION: Creates a blue rectangular region at (442, 117) spanning 38 by 20 pixels.
; PLAN: r0=442(x), r1=117(y), r2=38(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 117
LDI r2, 38
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
