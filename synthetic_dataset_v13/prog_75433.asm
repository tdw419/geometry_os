; DESCRIPTION: Creates a blue rectangular region at (191, 99) spanning 98 by 13 pixels.
; PLAN: r0=191(x), r1=99(y), r2=98(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 99
LDI r2, 98
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
