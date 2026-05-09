; DESCRIPTION: Creates a blue rectangular region at (19, 7) spanning 88 by 82 pixels.
; PLAN: r0=19(x), r1=7(y), r2=88(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 7
LDI r2, 88
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
