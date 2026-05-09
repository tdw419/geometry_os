; DESCRIPTION: Creates a red rectangular region at (381, 134) spanning 99 by 84 pixels.
; PLAN: r0=381(x), r1=134(y), r2=99(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 134
LDI r2, 99
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
