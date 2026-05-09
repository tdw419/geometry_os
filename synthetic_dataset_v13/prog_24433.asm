; DESCRIPTION: Creates a green rectangular region at (399, 68) spanning 107 by 112 pixels.
; PLAN: r0=399(x), r1=68(y), r2=107(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 68
LDI r2, 107
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
