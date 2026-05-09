; DESCRIPTION: Creates a green rectangular region at (240, 135) spanning 110 by 112 pixels.
; PLAN: r0=240(x), r1=135(y), r2=110(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 135
LDI r2, 110
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
