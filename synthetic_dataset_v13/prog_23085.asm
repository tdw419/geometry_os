; DESCRIPTION: Creates a green rectangular region at (359, 68) spanning 51 by 36 pixels.
; PLAN: r0=359(x), r1=68(y), r2=51(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 68
LDI r2, 51
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
