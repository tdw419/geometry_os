; DESCRIPTION: Creates a orange rectangular region at (105, 118) spanning 58 by 74 pixels.
; PLAN: r0=105(x), r1=118(y), r2=58(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 118
LDI r2, 58
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
