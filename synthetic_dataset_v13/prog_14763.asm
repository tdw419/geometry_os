; DESCRIPTION: Creates a red rectangular region at (11, 61) spanning 80 by 101 pixels.
; PLAN: r0=11(x), r1=61(y), r2=80(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 61
LDI r2, 80
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
