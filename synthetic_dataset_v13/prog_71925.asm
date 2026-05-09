; DESCRIPTION: Creates a red rectangular region at (165, 22) spanning 91 by 78 pixels.
; PLAN: r0=165(x), r1=22(y), r2=91(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 22
LDI r2, 91
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
