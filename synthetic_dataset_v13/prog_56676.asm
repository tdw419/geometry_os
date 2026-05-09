; DESCRIPTION: Creates a green rectangular region at (175, 7) spanning 43 by 72 pixels.
; PLAN: r0=175(x), r1=7(y), r2=43(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 7
LDI r2, 43
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
