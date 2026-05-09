; DESCRIPTION: Creates a blue rectangular region at (337, 123) spanning 58 by 107 pixels.
; PLAN: r0=337(x), r1=123(y), r2=58(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 123
LDI r2, 58
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
