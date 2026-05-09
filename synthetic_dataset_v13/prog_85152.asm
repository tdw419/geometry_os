; DESCRIPTION: Creates a blue rectangular region at (191, 119) spanning 68 by 44 pixels.
; PLAN: r0=191(x), r1=119(y), r2=68(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 119
LDI r2, 68
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
