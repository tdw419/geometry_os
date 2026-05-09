; DESCRIPTION: Creates a yellow rectangular region at (297, 141) spanning 118 by 63 pixels.
; PLAN: r0=297(x), r1=141(y), r2=118(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 141
LDI r2, 118
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
