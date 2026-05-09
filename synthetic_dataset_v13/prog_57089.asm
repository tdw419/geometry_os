; DESCRIPTION: Creates a red rectangular region at (56, 125) spanning 108 by 101 pixels.
; PLAN: r0=56(x), r1=125(y), r2=108(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 125
LDI r2, 108
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
