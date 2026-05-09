; DESCRIPTION: Creates a blue rectangular region at (205, 7) spanning 94 by 84 pixels.
; PLAN: r0=205(x), r1=7(y), r2=94(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 7
LDI r2, 94
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
