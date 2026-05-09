; DESCRIPTION: Creates a blue rectangular region at (372, 52) spanning 106 by 46 pixels.
; PLAN: r0=372(x), r1=52(y), r2=106(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 52
LDI r2, 106
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
