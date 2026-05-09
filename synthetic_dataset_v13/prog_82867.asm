; DESCRIPTION: Creates a black rectangular region at (156, 118) spanning 99 by 71 pixels.
; PLAN: r0=156(x), r1=118(y), r2=99(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 118
LDI r2, 99
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
