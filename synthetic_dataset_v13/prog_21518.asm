; DESCRIPTION: Creates a blue rectangular region at (395, 15) spanning 40 by 34 pixels.
; PLAN: r0=395(x), r1=15(y), r2=40(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 15
LDI r2, 40
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
