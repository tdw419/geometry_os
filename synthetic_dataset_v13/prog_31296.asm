; DESCRIPTION: Creates a yellow rectangular region at (246, 56) spanning 114 by 12 pixels.
; PLAN: r0=246(x), r1=56(y), r2=114(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 56
LDI r2, 114
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
