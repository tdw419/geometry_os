; DESCRIPTION: Creates a magenta rectangular region at (54, 68) spanning 71 by 102 pixels.
; PLAN: r0=54(x), r1=68(y), r2=71(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 68
LDI r2, 71
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
