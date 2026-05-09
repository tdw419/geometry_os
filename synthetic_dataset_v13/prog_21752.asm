; DESCRIPTION: Creates a red rectangular region at (137, 171) spanning 101 by 58 pixels.
; PLAN: r0=137(x), r1=171(y), r2=101(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 171
LDI r2, 101
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
