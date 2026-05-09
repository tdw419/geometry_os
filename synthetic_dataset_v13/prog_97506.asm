; DESCRIPTION: Creates a green rectangular region at (103, 92) spanning 31 by 110 pixels.
; PLAN: r0=103(x), r1=92(y), r2=31(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 92
LDI r2, 31
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
