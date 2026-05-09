; DESCRIPTION: Creates a white rectangular region at (252, 153) spanning 118 by 68 pixels.
; PLAN: r0=252(x), r1=153(y), r2=118(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 153
LDI r2, 118
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
