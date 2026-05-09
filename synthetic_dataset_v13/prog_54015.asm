; DESCRIPTION: Creates a black rectangular region at (175, 119) spanning 115 by 97 pixels.
; PLAN: r0=175(x), r1=119(y), r2=115(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 119
LDI r2, 115
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
