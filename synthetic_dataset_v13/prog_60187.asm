; DESCRIPTION: Creates a purple rectangular region at (156, 169) spanning 26 by 52 pixels.
; PLAN: r0=156(x), r1=169(y), r2=26(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 169
LDI r2, 26
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
