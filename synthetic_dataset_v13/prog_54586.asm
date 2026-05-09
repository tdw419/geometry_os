; DESCRIPTION: Creates a green rectangular region at (58, 55) spanning 96 by 99 pixels.
; PLAN: r0=58(x), r1=55(y), r2=96(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 55
LDI r2, 96
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
