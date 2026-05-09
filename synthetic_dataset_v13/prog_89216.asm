; DESCRIPTION: Creates a red rectangular region at (415, 122) spanning 75 by 118 pixels.
; PLAN: r0=415(x), r1=122(y), r2=75(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 122
LDI r2, 75
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
