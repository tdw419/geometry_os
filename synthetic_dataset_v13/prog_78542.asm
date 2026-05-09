; DESCRIPTION: Creates a red rectangular region at (162, 128) spanning 100 by 78 pixels.
; PLAN: r0=162(x), r1=128(y), r2=100(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 128
LDI r2, 100
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
