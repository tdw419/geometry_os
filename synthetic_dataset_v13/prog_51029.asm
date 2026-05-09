; DESCRIPTION: Creates a yellow rectangular region at (414, 118) spanning 22 by 113 pixels.
; PLAN: r0=414(x), r1=118(y), r2=22(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 118
LDI r2, 22
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
