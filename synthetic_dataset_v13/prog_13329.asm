; DESCRIPTION: Creates a green rectangular region at (54, 136) spanning 113 by 118 pixels.
; PLAN: r0=54(x), r1=136(y), r2=113(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 136
LDI r2, 113
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
