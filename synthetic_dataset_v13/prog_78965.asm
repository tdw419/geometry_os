; DESCRIPTION: Creates a green rectangular region at (236, 181) spanning 35 by 70 pixels.
; PLAN: r0=236(x), r1=181(y), r2=35(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 181
LDI r2, 35
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
