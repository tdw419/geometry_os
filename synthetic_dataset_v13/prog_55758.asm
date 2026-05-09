; DESCRIPTION: Creates a green rectangular region at (90, 49) spanning 56 by 29 pixels.
; PLAN: r0=90(x), r1=49(y), r2=56(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 49
LDI r2, 56
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
