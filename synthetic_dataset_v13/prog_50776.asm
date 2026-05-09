; DESCRIPTION: Creates a red rectangular region at (178, 18) spanning 53 by 106 pixels.
; PLAN: r0=178(x), r1=18(y), r2=53(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 18
LDI r2, 53
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
