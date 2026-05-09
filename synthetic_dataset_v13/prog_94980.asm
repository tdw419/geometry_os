; DESCRIPTION: Creates a red rectangular region at (155, 106) spanning 18 by 70 pixels.
; PLAN: r0=155(x), r1=106(y), r2=18(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 106
LDI r2, 18
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
