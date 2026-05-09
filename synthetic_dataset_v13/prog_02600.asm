; DESCRIPTION: Creates a red rectangular region at (133, 55) spanning 118 by 12 pixels.
; PLAN: r0=133(x), r1=55(y), r2=118(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 55
LDI r2, 118
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
