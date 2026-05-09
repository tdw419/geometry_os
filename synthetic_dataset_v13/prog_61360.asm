; DESCRIPTION: Creates a blue rectangular region at (291, 22) spanning 73 by 40 pixels.
; PLAN: r0=291(x), r1=22(y), r2=73(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 22
LDI r2, 73
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
