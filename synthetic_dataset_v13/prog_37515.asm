; DESCRIPTION: Creates a green rectangular region at (200, 179) spanning 49 by 14 pixels.
; PLAN: r0=200(x), r1=179(y), r2=49(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 179
LDI r2, 49
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
