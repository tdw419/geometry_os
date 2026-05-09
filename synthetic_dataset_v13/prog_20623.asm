; DESCRIPTION: Creates a green rectangular region at (361, 64) spanning 30 by 106 pixels.
; PLAN: r0=361(x), r1=64(y), r2=30(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 64
LDI r2, 30
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
