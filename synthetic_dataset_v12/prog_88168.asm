; DESCRIPTION: Creates a blue rectangular region at (160, 37) spanning 102 by 19 pixels.
; PLAN: r0=160(x), r1=37(y), r2=102(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 37
LDI r2, 102
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
