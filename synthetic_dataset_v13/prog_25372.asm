; DESCRIPTION: Creates a green rectangular region at (292, 92) spanning 116 by 116 pixels.
; PLAN: r0=292(x), r1=92(y), r2=116(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 92
LDI r2, 116
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
