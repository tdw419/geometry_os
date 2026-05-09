; DESCRIPTION: Creates a red rectangular region at (169, 5) spanning 88 by 77 pixels.
; PLAN: r0=169(x), r1=5(y), r2=88(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 5
LDI r2, 88
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
