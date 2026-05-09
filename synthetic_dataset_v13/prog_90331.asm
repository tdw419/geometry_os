; DESCRIPTION: Creates a red rectangular region at (181, 95) spanning 118 by 79 pixels.
; PLAN: r0=181(x), r1=95(y), r2=118(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 95
LDI r2, 118
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
