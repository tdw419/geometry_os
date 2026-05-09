; DESCRIPTION: Creates a green rectangular region at (72, 19) spanning 96 by 80 pixels.
; PLAN: r0=72(x), r1=19(y), r2=96(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 19
LDI r2, 96
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
