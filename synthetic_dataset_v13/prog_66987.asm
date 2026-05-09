; DESCRIPTION: Creates a blue rectangular region at (122, 18) spanning 47 by 49 pixels.
; PLAN: r0=122(x), r1=18(y), r2=47(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 18
LDI r2, 47
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
