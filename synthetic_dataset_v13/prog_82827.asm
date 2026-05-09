; DESCRIPTION: Creates a white rectangular region at (167, 139) spanning 54 by 114 pixels.
; PLAN: r0=167(x), r1=139(y), r2=54(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 139
LDI r2, 54
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
