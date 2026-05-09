; DESCRIPTION: Creates a red rectangular region at (137, 131) spanning 115 by 88 pixels.
; PLAN: r0=137(x), r1=131(y), r2=115(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 131
LDI r2, 115
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
