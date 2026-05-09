; DESCRIPTION: Creates a green rectangular region at (282, 135) spanning 73 by 21 pixels.
; PLAN: r0=282(x), r1=135(y), r2=73(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 135
LDI r2, 73
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
