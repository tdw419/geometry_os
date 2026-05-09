; DESCRIPTION: Creates a green rectangular region at (220, 25) spanning 44 by 88 pixels.
; PLAN: r0=220(x), r1=25(y), r2=44(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 25
LDI r2, 44
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
