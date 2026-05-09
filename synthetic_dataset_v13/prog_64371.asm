; DESCRIPTION: Creates a yellow rectangular region at (212, 118) spanning 101 by 111 pixels.
; PLAN: r0=212(x), r1=118(y), r2=101(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 118
LDI r2, 101
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
