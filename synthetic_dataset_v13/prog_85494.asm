; DESCRIPTION: Creates a blue rectangular region at (306, 126) spanning 108 by 22 pixels.
; PLAN: r0=306(x), r1=126(y), r2=108(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 126
LDI r2, 108
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
