; DESCRIPTION: Creates a magenta rectangular region at (355, 139) spanning 54 by 92 pixels.
; PLAN: r0=355(x), r1=139(y), r2=54(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 139
LDI r2, 54
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
