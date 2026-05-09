; DESCRIPTION: Creates a red rectangular region at (155, 60) spanning 23 by 110 pixels.
; PLAN: r0=155(x), r1=60(y), r2=23(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 60
LDI r2, 23
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
