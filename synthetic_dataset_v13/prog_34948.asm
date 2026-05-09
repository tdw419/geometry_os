; DESCRIPTION: Creates a red rectangular region at (2, 147) spanning 106 by 66 pixels.
; PLAN: r0=2(x), r1=147(y), r2=106(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 147
LDI r2, 106
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
