; DESCRIPTION: Creates a blue rectangular region at (164, 88) spanning 36 by 25 pixels.
; PLAN: r0=164(x), r1=88(y), r2=36(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 88
LDI r2, 36
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
