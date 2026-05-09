; DESCRIPTION: Creates a blue rectangular region at (427, 115) spanning 45 by 43 pixels.
; PLAN: r0=427(x), r1=115(y), r2=45(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 115
LDI r2, 45
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
