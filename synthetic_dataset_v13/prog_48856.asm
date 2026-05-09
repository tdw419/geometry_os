; DESCRIPTION: Creates a red rectangular region at (332, 92) spanning 50 by 106 pixels.
; PLAN: r0=332(x), r1=92(y), r2=50(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 92
LDI r2, 50
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
