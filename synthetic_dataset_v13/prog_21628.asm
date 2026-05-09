; DESCRIPTION: Creates a green rectangular region at (163, 49) spanning 103 by 75 pixels.
; PLAN: r0=163(x), r1=49(y), r2=103(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 49
LDI r2, 103
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
