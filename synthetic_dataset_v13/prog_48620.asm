; DESCRIPTION: Creates a red rectangular region at (34, 57) spanning 55 by 96 pixels.
; PLAN: r0=34(x), r1=57(y), r2=55(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 57
LDI r2, 55
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
