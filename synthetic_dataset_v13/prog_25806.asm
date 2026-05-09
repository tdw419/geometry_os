; DESCRIPTION: Creates a green rectangular region at (145, 84) spanning 77 by 19 pixels.
; PLAN: r0=145(x), r1=84(y), r2=77(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 84
LDI r2, 77
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
