; DESCRIPTION: Creates a red rectangular region at (297, 58) spanning 75 by 78 pixels.
; PLAN: r0=297(x), r1=58(y), r2=75(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 58
LDI r2, 75
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
