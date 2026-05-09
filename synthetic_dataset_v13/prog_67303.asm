; DESCRIPTION: Creates a blue rectangular region at (254, 20) spanning 22 by 71 pixels.
; PLAN: r0=254(x), r1=20(y), r2=22(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 20
LDI r2, 22
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
