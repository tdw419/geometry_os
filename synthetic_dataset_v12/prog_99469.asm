; DESCRIPTION: Creates a magenta rectangular region at (29, 0) spanning 116 by 102 pixels.
; PLAN: r0=29(x), r1=0(y), r2=116(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 0
LDI r2, 116
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
