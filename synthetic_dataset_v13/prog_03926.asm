; DESCRIPTION: Creates a green rectangular region at (376, 180) spanning 105 by 22 pixels.
; PLAN: r0=376(x), r1=180(y), r2=105(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 180
LDI r2, 105
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
