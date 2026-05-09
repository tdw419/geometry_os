; DESCRIPTION: Creates a red rectangular region at (444, 121) spanning 20 by 115 pixels.
; PLAN: r0=444(x), r1=121(y), r2=20(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 121
LDI r2, 20
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
