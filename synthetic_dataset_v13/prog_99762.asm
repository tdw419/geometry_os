; DESCRIPTION: Creates a green rectangular region at (175, 97) spanning 14 by 48 pixels.
; PLAN: r0=175(x), r1=97(y), r2=14(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 97
LDI r2, 14
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
