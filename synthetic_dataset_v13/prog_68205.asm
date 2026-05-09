; DESCRIPTION: Creates a green rectangular region at (420, 49) spanning 90 by 21 pixels.
; PLAN: r0=420(x), r1=49(y), r2=90(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 49
LDI r2, 90
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
