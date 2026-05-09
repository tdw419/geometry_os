; DESCRIPTION: Creates a yellow rectangular region at (51, 116) spanning 56 by 116 pixels.
; PLAN: r0=51(x), r1=116(y), r2=56(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 116
LDI r2, 56
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
