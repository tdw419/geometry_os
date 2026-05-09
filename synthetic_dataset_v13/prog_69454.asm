; DESCRIPTION: Creates a red rectangular region at (106, 99) spanning 34 by 38 pixels.
; PLAN: r0=106(x), r1=99(y), r2=34(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 99
LDI r2, 34
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
