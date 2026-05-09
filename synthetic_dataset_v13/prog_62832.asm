; DESCRIPTION: Creates a red rectangular region at (178, 101) spanning 14 by 58 pixels.
; PLAN: r0=178(x), r1=101(y), r2=14(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 101
LDI r2, 14
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
