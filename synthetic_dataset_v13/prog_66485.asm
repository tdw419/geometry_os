; DESCRIPTION: Creates a red rectangular region at (50, 118) spanning 109 by 34 pixels.
; PLAN: r0=50(x), r1=118(y), r2=109(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 118
LDI r2, 109
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
