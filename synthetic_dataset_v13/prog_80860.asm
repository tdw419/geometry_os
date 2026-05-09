; DESCRIPTION: Creates a red rectangular region at (172, 70) spanning 119 by 101 pixels.
; PLAN: r0=172(x), r1=70(y), r2=119(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 70
LDI r2, 119
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
