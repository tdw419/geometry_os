; DESCRIPTION: Creates a white rectangular region at (158, 53) spanning 65 by 101 pixels.
; PLAN: r0=158(x), r1=53(y), r2=65(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 53
LDI r2, 65
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
