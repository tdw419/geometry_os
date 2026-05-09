; DESCRIPTION: Creates a yellow rectangular region at (381, 136) spanning 116 by 113 pixels.
; PLAN: r0=381(x), r1=136(y), r2=116(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 136
LDI r2, 116
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
