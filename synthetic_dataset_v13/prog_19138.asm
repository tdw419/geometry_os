; DESCRIPTION: Creates a black rectangular region at (118, 131) spanning 68 by 73 pixels.
; PLAN: r0=118(x), r1=131(y), r2=68(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 131
LDI r2, 68
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
