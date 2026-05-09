; DESCRIPTION: Creates a orange rectangular region at (158, 25) spanning 54 by 81 pixels.
; PLAN: r0=158(x), r1=25(y), r2=54(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 25
LDI r2, 54
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
