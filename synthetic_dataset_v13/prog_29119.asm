; DESCRIPTION: Creates a red rectangular region at (155, 30) spanning 84 by 56 pixels.
; PLAN: r0=155(x), r1=30(y), r2=84(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 30
LDI r2, 84
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
