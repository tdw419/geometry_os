; DESCRIPTION: Creates a yellow rectangular region at (78, 37) spanning 91 by 38 pixels.
; PLAN: r0=78(x), r1=37(y), r2=91(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 37
LDI r2, 91
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
