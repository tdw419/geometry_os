; DESCRIPTION: Creates a yellow rectangular region at (276, 118) spanning 20 by 107 pixels.
; PLAN: r0=276(x), r1=118(y), r2=20(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 118
LDI r2, 20
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
