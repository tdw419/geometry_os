; DESCRIPTION: Creates a black rectangular region at (189, 118) spanning 26 by 93 pixels.
; PLAN: r0=189(x), r1=118(y), r2=26(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 118
LDI r2, 26
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
