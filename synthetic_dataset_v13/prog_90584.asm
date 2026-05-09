; DESCRIPTION: Creates a blue rectangular region at (470, 110) spanning 29 by 25 pixels.
; PLAN: r0=470(x), r1=110(y), r2=29(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 110
LDI r2, 29
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
