; DESCRIPTION: Creates a red rectangular region at (223, 58) spanning 106 by 62 pixels.
; PLAN: r0=223(x), r1=58(y), r2=106(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 58
LDI r2, 106
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
