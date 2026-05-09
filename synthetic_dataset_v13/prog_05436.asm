; DESCRIPTION: Creates a red rectangular region at (463, 15) spanning 22 by 92 pixels.
; PLAN: r0=463(x), r1=15(y), r2=22(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 15
LDI r2, 22
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
