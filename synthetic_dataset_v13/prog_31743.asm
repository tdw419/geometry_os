; DESCRIPTION: Creates a red rectangular region at (23, 100) spanning 118 by 86 pixels.
; PLAN: r0=23(x), r1=100(y), r2=118(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 100
LDI r2, 118
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
