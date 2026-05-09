; DESCRIPTION: Creates a red rectangular region at (12, 118) spanning 99 by 105 pixels.
; PLAN: r0=12(x), r1=118(y), r2=99(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 118
LDI r2, 99
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
