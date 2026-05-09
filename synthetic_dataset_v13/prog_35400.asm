; DESCRIPTION: Creates a green rectangular region at (105, 22) spanning 102 by 113 pixels.
; PLAN: r0=105(x), r1=22(y), r2=102(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 22
LDI r2, 102
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
