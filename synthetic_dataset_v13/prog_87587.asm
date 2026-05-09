; DESCRIPTION: Creates a white rectangular region at (29, 118) spanning 92 by 88 pixels.
; PLAN: r0=29(x), r1=118(y), r2=92(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 118
LDI r2, 92
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
