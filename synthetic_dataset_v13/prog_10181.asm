; DESCRIPTION: Creates a red rectangular region at (136, 92) spanning 13 by 13 pixels.
; PLAN: r0=136(x), r1=92(y), r2=13(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 92
LDI r2, 13
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
