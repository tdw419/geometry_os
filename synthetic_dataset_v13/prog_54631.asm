; DESCRIPTION: Creates a green rectangular region at (177, 1) spanning 114 by 74 pixels.
; PLAN: r0=177(x), r1=1(y), r2=114(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 1
LDI r2, 114
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
