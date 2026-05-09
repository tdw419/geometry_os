; DESCRIPTION: Creates a yellow rectangular region at (282, 116) spanning 90 by 29 pixels.
; PLAN: r0=282(x), r1=116(y), r2=90(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 116
LDI r2, 90
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
