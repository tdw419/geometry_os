; DESCRIPTION: Creates a green rectangular region at (165, 135) spanning 58 by 84 pixels.
; PLAN: r0=165(x), r1=135(y), r2=58(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 135
LDI r2, 58
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
