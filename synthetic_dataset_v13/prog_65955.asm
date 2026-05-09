; DESCRIPTION: Creates a blue rectangular region at (233, 52) spanning 106 by 94 pixels.
; PLAN: r0=233(x), r1=52(y), r2=106(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 52
LDI r2, 106
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
