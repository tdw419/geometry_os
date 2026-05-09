; DESCRIPTION: Creates a red rectangular region at (25, 88) spanning 95 by 20 pixels.
; PLAN: r0=25(x), r1=88(y), r2=95(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 88
LDI r2, 95
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
