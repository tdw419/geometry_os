; DESCRIPTION: Creates a blue rectangular region at (147, 124) spanning 99 by 11 pixels.
; PLAN: r0=147(x), r1=124(y), r2=99(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 124
LDI r2, 99
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
