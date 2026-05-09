; DESCRIPTION: Creates a green rectangular region at (138, 167) spanning 68 by 71 pixels.
; PLAN: r0=138(x), r1=167(y), r2=68(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 167
LDI r2, 68
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
