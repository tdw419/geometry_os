; DESCRIPTION: Creates a blue rectangular region at (395, 137) spanning 117 by 33 pixels.
; PLAN: r0=395(x), r1=137(y), r2=117(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 137
LDI r2, 117
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
