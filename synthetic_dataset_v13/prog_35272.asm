; DESCRIPTION: Creates a white rectangular region at (22, 36) spanning 68 by 96 pixels.
; PLAN: r0=22(x), r1=36(y), r2=68(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 36
LDI r2, 68
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
