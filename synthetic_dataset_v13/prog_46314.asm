; DESCRIPTION: Creates a orange rectangular region at (131, 118) spanning 102 by 68 pixels.
; PLAN: r0=131(x), r1=118(y), r2=102(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 118
LDI r2, 102
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
