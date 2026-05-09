; DESCRIPTION: Creates a white rectangular region at (116, 100) spanning 92 by 40 pixels.
; PLAN: r0=116(x), r1=100(y), r2=92(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 100
LDI r2, 92
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
