; DESCRIPTION: Creates a blue rectangular region at (192, 23) spanning 12 by 99 pixels.
; PLAN: r0=192(x), r1=23(y), r2=12(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 23
LDI r2, 12
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
