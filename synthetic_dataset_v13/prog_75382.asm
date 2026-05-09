; DESCRIPTION: Creates a red rectangular region at (321, 88) spanning 31 by 95 pixels.
; PLAN: r0=321(x), r1=88(y), r2=31(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 88
LDI r2, 31
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
