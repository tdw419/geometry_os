; DESCRIPTION: Creates a blue rectangular region at (287, 200) spanning 99 by 29 pixels.
; PLAN: r0=287(x), r1=200(y), r2=99(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 200
LDI r2, 99
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
