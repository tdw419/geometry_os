; DESCRIPTION: Creates a green rectangular region at (60, 167) spanning 14 by 56 pixels.
; PLAN: r0=60(x), r1=167(y), r2=14(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 167
LDI r2, 14
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
