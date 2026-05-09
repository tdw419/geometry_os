; DESCRIPTION: Creates a red rectangular region at (246, 92) spanning 97 by 80 pixels.
; PLAN: r0=246(x), r1=92(y), r2=97(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 92
LDI r2, 97
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
