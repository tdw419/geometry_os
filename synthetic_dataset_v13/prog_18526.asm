; DESCRIPTION: Creates a orange rectangular region at (14, 124) spanning 118 by 101 pixels.
; PLAN: r0=14(x), r1=124(y), r2=118(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 124
LDI r2, 118
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
