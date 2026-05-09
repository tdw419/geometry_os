; DESCRIPTION: Creates a red rectangular region at (427, 101) spanning 46 by 22 pixels.
; PLAN: r0=427(x), r1=101(y), r2=46(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 101
LDI r2, 46
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
