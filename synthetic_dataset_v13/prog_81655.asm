; DESCRIPTION: Creates a blue rectangular region at (69, 86) spanning 78 by 37 pixels.
; PLAN: r0=69(x), r1=86(y), r2=78(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 86
LDI r2, 78
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
