; DESCRIPTION: Creates a magenta rectangular region at (81, 136) spanning 39 by 116 pixels.
; PLAN: r0=81(x), r1=136(y), r2=39(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 136
LDI r2, 39
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
