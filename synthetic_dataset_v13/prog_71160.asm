; DESCRIPTION: Creates a black rectangular region at (156, 71) spanning 118 by 58 pixels.
; PLAN: r0=156(x), r1=71(y), r2=118(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 71
LDI r2, 118
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
