; DESCRIPTION: Creates a green rectangular region at (306, 25) spanning 97 by 107 pixels.
; PLAN: r0=306(x), r1=25(y), r2=97(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 25
LDI r2, 97
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
