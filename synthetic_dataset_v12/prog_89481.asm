; DESCRIPTION: Creates a red rectangular region at (266, 66) spanning 72 by 96 pixels.
; PLAN: r0=266(x), r1=66(y), r2=72(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 66
LDI r2, 72
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
