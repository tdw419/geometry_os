; DESCRIPTION: Creates a green rectangular region at (34, 81) spanning 78 by 103 pixels.
; PLAN: r0=34(x), r1=81(y), r2=78(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 81
LDI r2, 78
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
