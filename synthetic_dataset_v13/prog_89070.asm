; DESCRIPTION: Creates a green rectangular region at (291, 167) spanning 92 by 83 pixels.
; PLAN: r0=291(x), r1=167(y), r2=92(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 167
LDI r2, 92
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
