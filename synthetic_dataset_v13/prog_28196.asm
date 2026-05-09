; DESCRIPTION: Creates a red rectangular region at (216, 100) spanning 40 by 106 pixels.
; PLAN: r0=216(x), r1=100(y), r2=40(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 100
LDI r2, 40
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
