; DESCRIPTION: Creates a red rectangular region at (343, 135) spanning 20 by 95 pixels.
; PLAN: r0=343(x), r1=135(y), r2=20(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 135
LDI r2, 20
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
