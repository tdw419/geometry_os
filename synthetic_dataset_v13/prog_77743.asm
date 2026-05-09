; DESCRIPTION: Creates a green rectangular region at (447, 115) spanning 56 by 106 pixels.
; PLAN: r0=447(x), r1=115(y), r2=56(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 115
LDI r2, 56
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
