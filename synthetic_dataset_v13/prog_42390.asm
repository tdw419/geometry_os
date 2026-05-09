; DESCRIPTION: Creates a green rectangular region at (194, 77) spanning 95 by 22 pixels.
; PLAN: r0=194(x), r1=77(y), r2=95(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 77
LDI r2, 95
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
