; DESCRIPTION: Creates a green rectangular region at (447, 156) spanning 47 by 13 pixels.
; PLAN: r0=447(x), r1=156(y), r2=47(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 156
LDI r2, 47
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
