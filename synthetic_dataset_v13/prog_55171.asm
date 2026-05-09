; DESCRIPTION: Creates a orange rectangular region at (162, 38) spanning 40 by 118 pixels.
; PLAN: r0=162(x), r1=38(y), r2=40(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 38
LDI r2, 40
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
