; DESCRIPTION: Creates a blue rectangular region at (337, 86) spanning 119 by 107 pixels.
; PLAN: r0=337(x), r1=86(y), r2=119(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 86
LDI r2, 119
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
