; DESCRIPTION: Creates a green rectangular region at (77, 57) spanning 96 by 51 pixels.
; PLAN: r0=77(x), r1=57(y), r2=96(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 57
LDI r2, 96
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
