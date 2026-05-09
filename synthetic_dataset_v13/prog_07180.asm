; DESCRIPTION: Creates a white rectangular region at (155, 22) spanning 92 by 10 pixels.
; PLAN: r0=155(x), r1=22(y), r2=92(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 22
LDI r2, 92
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
