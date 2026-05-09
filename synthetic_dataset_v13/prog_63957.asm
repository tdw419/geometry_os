; DESCRIPTION: Creates a green rectangular region at (209, 167) spanning 112 by 77 pixels.
; PLAN: r0=209(x), r1=167(y), r2=112(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 167
LDI r2, 112
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
