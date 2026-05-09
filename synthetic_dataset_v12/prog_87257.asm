; DESCRIPTION: Creates a orange rectangular region at (466, 158) spanning 36 by 75 pixels.
; PLAN: r0=466(x), r1=158(y), r2=36(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 158
LDI r2, 36
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
