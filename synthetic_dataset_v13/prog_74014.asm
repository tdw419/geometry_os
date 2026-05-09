; DESCRIPTION: Creates a blue rectangular region at (288, 26) spanning 22 by 40 pixels.
; PLAN: r0=288(x), r1=26(y), r2=22(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 26
LDI r2, 22
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
