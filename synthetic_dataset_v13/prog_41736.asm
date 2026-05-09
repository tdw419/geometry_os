; DESCRIPTION: Creates a green rectangular region at (54, 172) spanning 73 by 77 pixels.
; PLAN: r0=54(x), r1=172(y), r2=73(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 172
LDI r2, 73
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
