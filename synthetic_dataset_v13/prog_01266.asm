; DESCRIPTION: Creates a magenta rectangular region at (169, 101) spanning 10 by 102 pixels.
; PLAN: r0=169(x), r1=101(y), r2=10(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 101
LDI r2, 10
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
