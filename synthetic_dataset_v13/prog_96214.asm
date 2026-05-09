; DESCRIPTION: Creates a white rectangular region at (68, 96) spanning 73 by 78 pixels.
; PLAN: r0=68(x), r1=96(y), r2=73(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 96
LDI r2, 73
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
