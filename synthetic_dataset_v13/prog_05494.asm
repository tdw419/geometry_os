; DESCRIPTION: Creates a green rectangular region at (190, 35) spanning 35 by 114 pixels.
; PLAN: r0=190(x), r1=35(y), r2=35(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 35
LDI r2, 35
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
