; DESCRIPTION: Creates a green rectangular region at (292, 92) spanning 107 by 72 pixels.
; PLAN: r0=292(x), r1=92(y), r2=107(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 92
LDI r2, 107
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
