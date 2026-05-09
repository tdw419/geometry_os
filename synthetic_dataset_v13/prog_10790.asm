; DESCRIPTION: Creates a red rectangular region at (355, 80) spanning 91 by 84 pixels.
; PLAN: r0=355(x), r1=80(y), r2=91(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 80
LDI r2, 91
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
