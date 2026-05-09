; DESCRIPTION: Creates a blue rectangular region at (330, 49) spanning 102 by 21 pixels.
; PLAN: r0=330(x), r1=49(y), r2=102(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 49
LDI r2, 102
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
