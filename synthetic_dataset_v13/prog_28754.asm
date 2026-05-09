; DESCRIPTION: Creates a red rectangular region at (16, 101) spanning 75 by 43 pixels.
; PLAN: r0=16(x), r1=101(y), r2=75(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 101
LDI r2, 75
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
