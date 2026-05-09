; DESCRIPTION: Creates a yellow rectangular region at (58, 183) spanning 113 by 15 pixels.
; PLAN: r0=58(x), r1=183(y), r2=113(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 183
LDI r2, 113
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
