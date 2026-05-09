; DESCRIPTION: Creates a magenta rectangular region at (313, 169) spanning 60 by 57 pixels.
; PLAN: r0=313(x), r1=169(y), r2=60(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 169
LDI r2, 60
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
