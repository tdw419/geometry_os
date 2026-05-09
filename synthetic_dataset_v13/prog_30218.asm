; DESCRIPTION: Creates a white rectangular region at (81, 167) spanning 13 by 14 pixels.
; PLAN: r0=81(x), r1=167(y), r2=13(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 167
LDI r2, 13
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
