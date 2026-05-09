; DESCRIPTION: Creates a red rectangular region at (483, 66) spanning 28 by 100 pixels.
; PLAN: r0=483(x), r1=66(y), r2=28(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 66
LDI r2, 28
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
