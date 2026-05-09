; DESCRIPTION: Creates a green rectangular region at (29, 44) spanning 85 by 114 pixels.
; PLAN: r0=29(x), r1=44(y), r2=85(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 44
LDI r2, 85
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
