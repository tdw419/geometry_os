; DESCRIPTION: Creates a green rectangular region at (112, 114) spanning 38 by 60 pixels.
; PLAN: r0=112(x), r1=114(y), r2=38(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 114
LDI r2, 38
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
