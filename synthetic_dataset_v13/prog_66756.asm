; DESCRIPTION: Creates a red rectangular region at (16, 123) spanning 118 by 68 pixels.
; PLAN: r0=16(x), r1=123(y), r2=118(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 123
LDI r2, 118
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
