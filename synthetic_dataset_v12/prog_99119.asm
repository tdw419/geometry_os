; DESCRIPTION: Creates a green rectangular region at (91, 18) spanning 39 by 118 pixels.
; PLAN: r0=91(x), r1=18(y), r2=39(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 18
LDI r2, 39
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
