; DESCRIPTION: Creates a magenta rectangular region at (169, 11) spanning 44 by 93 pixels.
; PLAN: r0=169(x), r1=11(y), r2=44(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 11
LDI r2, 44
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
