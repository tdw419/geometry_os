; DESCRIPTION: Creates a white rectangular region at (483, 61) spanning 26 by 101 pixels.
; PLAN: r0=483(x), r1=61(y), r2=26(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 61
LDI r2, 26
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
