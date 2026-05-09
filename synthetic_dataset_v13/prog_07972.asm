; DESCRIPTION: Creates a red rectangular region at (364, 167) spanning 106 by 58 pixels.
; PLAN: r0=364(x), r1=167(y), r2=106(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 167
LDI r2, 106
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
