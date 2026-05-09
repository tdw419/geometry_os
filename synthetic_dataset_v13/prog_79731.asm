; DESCRIPTION: Creates a green rectangular region at (476, 37) spanning 10 by 18 pixels.
; PLAN: r0=476(x), r1=37(y), r2=10(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 37
LDI r2, 10
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
